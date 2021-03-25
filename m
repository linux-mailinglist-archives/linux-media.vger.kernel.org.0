Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A69F348A7B
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 08:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhCYHuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 03:50:55 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:48061 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229890AbhCYHu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 03:50:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PKl6laUNQFRvvPKl9lS7ef; Thu, 25 Mar 2021 08:50:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616658628; bh=g+tcJ+YtGBjeVjke0cKINm0uYkIqozndwXQneYqUQSg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gdwHF0ju7R6PqFyNGWACgzD2MVKiyTGg2LomJYIpc3gnt+pHyO1MPk8ESrYcAov8A
         paC3Cu3NyeqsJg7QPLBLpODO0jALhQWZnFIKXo3eW0yU3Moo38eNf9pJ+7Yv2X2o3G
         IQoxStws7UzvPEsvVnp/pPF6gD7rIQ63D5ZN8R/7ck727FJoKEgVXYuzjmoLAM/klU
         sjubjS7jaM0onZDxsBU7daWp0W7/ZyezdushMzXiR+bmQczUtNxkM4QY8Umwgr9eAX
         /Uh+uG0DzMPFkD8F/qaW6CfRC/3ZCwsXgkBygcFNtxCGQEEUavRY0pzub22col3w4T
         pQJ6lfDvOHJlg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] vivid: update EDID
Message-ID: <8539ec09-67a7-9ae2-7936-894d792c31cc@xs4all.nl>
Date:   Thu, 25 Mar 2021 08:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMOuNIzTgIvVmettTK85IHliEfsYQAv0g+UN66wx8NxCjEMTrztDP1S2kDvsWENZAOi4K/IKEt0Ilv08KNfcVw2d+sSmA0hAMN8KVTEFeY3oPDWaBq2+
 nPvnZXFYung+LB/4JU+GllmaDeKDmUAGNQyyiXciIB6s2zdtNZXDGO4xdnnmYFZeGWqt3suYZ+hehi9rgSbpAUX3kB4jdkJBRzY=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The EDID had a few mistakes as reported by edid-decode:

Block 1, CTA-861 Extension Block:
  Video Data Block: For improved preferred timing interoperability, set 'Native detailed modes' to 1.
  Video Capability Data Block: S_PT is equal to S_IT and S_CE, so should be set to 0 instead.

Fixed those.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
v2: this time patch the vivid driver, not the cobalt driver :-)
---
 drivers/media/test-drivers/vivid/vivid-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 0dc65ef3aa14..ca0ebf6ad9cc 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -205,13 +205,13 @@ static const u8 vivid_hdmi_edid[256] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x7b,

-	0x02, 0x03, 0x3f, 0xf0, 0x51, 0x61, 0x60, 0x5f,
+	0x02, 0x03, 0x3f, 0xf1, 0x51, 0x61, 0x60, 0x5f,
 	0x5e, 0x5d, 0x10, 0x1f, 0x04, 0x13, 0x22, 0x21,
 	0x20, 0x05, 0x14, 0x02, 0x11, 0x01, 0x23, 0x09,
 	0x07, 0x07, 0x83, 0x01, 0x00, 0x00, 0x6d, 0x03,
 	0x0c, 0x00, 0x10, 0x00, 0x00, 0x3c, 0x21, 0x00,
 	0x60, 0x01, 0x02, 0x03, 0x67, 0xd8, 0x5d, 0xc4,
-	0x01, 0x78, 0x00, 0x00, 0xe2, 0x00, 0xea, 0xe3,
+	0x01, 0x78, 0x00, 0x00, 0xe2, 0x00, 0xca, 0xe3,
 	0x05, 0x00, 0x00, 0xe3, 0x06, 0x01, 0x00, 0x4d,
 	0xd0, 0x00, 0xa0, 0xf0, 0x70, 0x3e, 0x80, 0x30,
 	0x20, 0x35, 0x00, 0xc0, 0x1c, 0x32, 0x00, 0x00,
@@ -220,7 +220,7 @@ static const u8 vivid_hdmi_edid[256] = {
 	0x00, 0x00, 0x1a, 0x1a, 0x1d, 0x00, 0x80, 0x51,
 	0xd0, 0x1c, 0x20, 0x40, 0x80, 0x35, 0x00, 0xc0,
 	0x1c, 0x32, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00,
-	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x63,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x82,
 };

 static int vidioc_querycap(struct file *file, void  *priv,
-- 
2.30.1


