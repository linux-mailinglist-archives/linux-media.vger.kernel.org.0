Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C031C183018
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 13:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgCLMUd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 08:20:33 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:48105 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726254AbgCLMUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 08:20:33 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CMpAjwyEshVf8CMpDjMRXa; Thu, 12 Mar 2020 13:20:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584015632; bh=tjVzU23GOEMTaLw6yJ2EZGwBozJmx1X+NWFoe0WoNTQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rDn+r37Ek9+WWnpdeBhKjvVde6oDSduPeEmTr4ZvJhVXeXanlEgocbbDZYTMXf5rj
         PJnY9m4y9WJgK7rNFtd2P5vwGSHk2V0ag7uEc3gKVZAjHWZ/x+z99FW+QrArRQ/oBv
         YkJyJOtjmDqwpq5GeuTfuwwdDykL7usvtVOCGyAzcf5nZnYieYcHHcHEJIbFVZAAvL
         FBcfnDIANSgf9ualkJAhNMuyGjqNhv/w8w39MGvtBTCEY0oNIV/U1kXNRBIza4MxzC
         v4yKbEBrs/bgCO0cq3lKIhBygQodcqNNjAkmzrL2Gymv/L4UUoJiqc1TMgjQ9YVgux
         C+VV7h4pWNv6g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] imx: Miscellaneous fixes for i.MX7
Message-ID: <5a215342-21b6-a993-f7a2-bbf52c8b771f@xs4all.nl>
Date:   Thu, 12 Mar 2020 13:20:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDRE1ByWT6nxT3CdkSpVKG4cAGfBYNfio8etgmmhExVombgYNBV6D/YWV5/33AtKCozuhSm7dS+EpXDxwtKiHwepdo+jFPtFMmT0FHMLjarcjpvCGbPp
 fOdCrKNr8o5BtMjCm44oMsD8lczJFxZ3DDZx6K5jfXgb9cZFqLEC38Y5fM0tUompE2+VmK6IwO2dvtu0tmTPxVt2SupThXpuipUIPB6Skx7Wye0CxFhIrWy9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit eceeea5481d4eeb6073e8ccb2f229bb0dd14a44d:

  media: lmedm04: remove redundant assignment to variable gate (2020-03-12 09:47:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7j

for you to fetch changes up to 4f62a57b3be3c3b88512e4371a5620483082ccd8:

  media: imx: imx7-media-csi: Support clamping Y10 and Y12 to Y8 (2020-03-12 13:15:34 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (10):
      media: imx: imx7_mipi_csis: Power off the source when stopping streaming
      media: imx: imx7_mipi_csis: Print the RESOL_CH0 register
      media: imx: imx7_mipi_csis: Add greyscale formats support
      media: imx: imx7-mipi-csis: Filter on CSI-2 data type
      media: imx: imx7-media-csi: Remove unneeded register read
      media: imx: imx7-media-csi: Fix video field handling
      media: imx: imx6-media-csi: Replace Y16 with Y10 and Y12
      media: imx: imx6-media-csi: Support clamping Y10 and Y12 to Y8
      media: imx: imx7-media-csi: Add Y10 and Y12 formats support
      media: imx: imx7-media-csi: Support clamping Y10 and Y12 to Y8

 drivers/staging/media/imx/imx-media-csi.c   |  3 ++-
 drivers/staging/media/imx/imx-media-utils.c | 19 +++++++++++++------
 drivers/staging/media/imx/imx7-media-csi.c  | 22 +++++++++++++++++++++-
 drivers/staging/media/imx/imx7-mipi-csis.c  | 16 +++++++++++++++-
 4 files changed, 51 insertions(+), 9 deletions(-)
