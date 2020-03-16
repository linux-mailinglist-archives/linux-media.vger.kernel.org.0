Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5BD1867FB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 10:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730436AbgCPJgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 05:36:54 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41671 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730056AbgCPJgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 05:36:54 -0400
Received: from tschai.fritz.box ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DmAyjwybrEE3qDmB1jdJxD; Mon, 16 Mar 2020 10:36:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584351412; bh=S8gJjNg45/rBUz38ZnB9zRcEKuk4G/KNiRtJ3/FINP4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=dtpGU0M35EjCujAEcv49g2VUB29yoTzu/nByPz5n8EYpy+m5G0M18Wj13re6OZMhd
         yyXs7m4kjM7E3rj0jzMKe0dtf0fILnWex6meoSccS8OHM69J+hrKPLLO7bJH7kHsg/
         Zjad+8/tZ41vZxqw+CYyNkJ2pyIfrGe1acHRSIf8S4iA25MXWiQ+s3sU7L/2zyFtR7
         Sx6rINZ6L++OtLCVZX0kIDILDjaXTgNLh3tOEZwcP2lCMI61ucMWHWBQtajEljojzc
         uBKNj5bdslYuIPDKlV2AQeWRcyYVfMypnShKiFvhU9DuNV5ElHTIS84mHDX5O7alUv
         g41TUqNpOVTSQ==
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/2] cec: two small changes
Date:   Mon, 16 Mar 2020 10:36:46 +0100
Message-Id: <20200316093648.1280689-1-hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDaWk2F5em+x6HoDQRYP3KxlNC1sxz+oA7cj9QxTZRkXoC4KlafAsvkM1Os4fmzA27PVWvbqw7Acev1PcxDrSoMZOSZ1b02rpmn69xQFJLwQrm0idzkO
 LRox19YTfD6qA3gqdDswWCtyirdoWXQDfmqZnAzCSzSGqbzEg7bZCsMomRf8Hf6/xBnxUqPv7ipRyg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

The first patch renames an argument to prepare for future work and
the second makes cec_notifier_get_conn() static since drivers no longer
call this function.

I have more patches pending but those need more testing.

Regards,

	Hans

Hans Verkuil (2):
  cec-notifier: rename conn_name to port_name
  cec-notifier: make cec_notifier_get_conn() static

 drivers/media/cec/cec-notifier.c | 41 +++++++++++++++++++++-----------
 include/media/cec-notifier.h     | 39 +++++++-----------------------
 2 files changed, 35 insertions(+), 45 deletions(-)

-- 
2.25.1

