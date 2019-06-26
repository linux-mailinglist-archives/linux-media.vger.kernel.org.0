Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB7356276
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 08:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfFZGkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 02:40:00 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:60965 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725876AbfFZGj7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 02:39:59 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id g1azhV1GQSfvXg1b3hJErf; Wed, 26 Jun 2019 08:39:57 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] cec: improve notifier API, prepare for connector
 info
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Message-ID: <c7dffb66-17a2-466d-bcd1-a1c5718b29be@xs4all.nl>
Date:   Wed, 26 Jun 2019 08:39:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfORCWU8Sf0QB6imngYVpVfNr5daxm2sb6ojXfm0Bk1ZQk6XnTLGTQHfgWY14L7hDhgcBdIKFI/3atcowomaT2I0A7BpiDiOmCs4WRZbiAS0LwfceUxJY
 fVMwCH/w3CHBsrMKy0seCeYKdddSHzWloxSoSyYTZBOKsNYXTTFEinTtjiaj6hV0zs+p4BCMOBjoem1qWskPhyd+UcPQcfFMb4o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This pull request consists of the first three patches of this larger patch
series: https://www.spinics.net/lists/linux-media/msg153276.html

This prepares the CEC core for a new ioctl: CEC_ADAP_G_CONNECTOR_INFO. This
will help link the CEC adapter with the corresponding DRM connector. For this
to work, DRM drivers will need to provide the connector info when they create
the CEC adapter (through the new cec_s_conn_info() function) or when they
create the cec_notifier (through the new cec_notifier_conn_register() function).

Note that currently the connector info is only supported for HDMI output connectors
(drm). The plan is to add support for HDMI input connectors as well, once I figure
out how to specify that since we don't have a nice way of defining that in V4L2.

This series also implements replacement functions for the old cec_notifier_get_conn
and cec_notifier_put functions: these were used both by drm and cec adapters, but
that no longer works since drm now needs to pass the connector info, and in addition
we will see in the future multiple cec adapters connected to the same HDMI connector.

A typical use-case for that is to have one CEC adapter with limited functionality
used when the system is in a low-power mode, and one full-fledged CEC adapter used
when the system is powered up.

So besides the cec_notifier_get_conn and cec_notifier_put functions four new
replacement functions are added:

cec_notifier_conn_(un)register and cec_notifier_cec_adap_(un)register.

That way the CEC framework will know if a notifier is registered for an HDMI
connector or a CEC adapter, and that can be used to implement a 1-N relationship
in the future.

Once all drivers are converted to using these functions the old cec_notifier_get_conn
and cec_notifier_put functions can be removed. Also the cec_notifier_(un)register and
cec_register_cec_notifier() functions can be removed since that functionality is now
done in the new cec_notifier_cec_adap_(un)register functions.

For now the connector info uAPI is disabled, but these three patches provide the
framework and will make it possible to convert the drm and media drivers independently
from one another during the 5.4 cycle.

Note that these three patches do not change any existing functionality. They just
create the kernel APIs needed to implement the new features in drm and media drivers.

Regards,

	Hans

The following changes since commit 86d617d6c79d79288ca608b6fb0a2467b0e8ddbb:

  media: MAINTAINERS: Add maintainers for Media Controller (2019-06-24 15:07:51 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-cec-conn2

for you to fetch changes up to 4c815c4b6564c76b4ca3af6af60a3cff50b0737e:

  cec-notifier: add new notifier functions (2019-06-26 08:12:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dariusz Marcinkiewicz (1):
      cec: add struct cec_connector_info support

Hans Verkuil (2):
      cec-notifier: rename variables, check kstrdup and n->conn_name
      cec-notifier: add new notifier functions

 drivers/media/cec/cec-adap.c               |  29 +++++++++++++++
 drivers/media/cec/cec-core.c               |   5 +++
 drivers/media/cec/cec-notifier.c           | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/media/platform/seco-cec/seco-cec.c |   2 +-
 include/media/cec-notifier.h               | 105 ++++++++++++++++++++++++++++++++++++-----------------
 include/media/cec.h                        |  98 +++++++++++++++++++++++++++++++++++++++++++++++++-
 6 files changed, 307 insertions(+), 44 deletions(-)
