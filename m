Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE7040A742
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240231AbhINHWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239423AbhINHWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:22:46 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C317C061764
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 00:21:29 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Q2kvmLWOteJ0cQ2kxmnBgB; Tue, 14 Sep 2021 09:21:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631604087; bh=RJI7Jy7BCHZHfPYSiBFKj1abQw7y320Lwq/0VwCiuik=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VKxNfjV25UGdNuMNN/+/BKcf4MNZFdZghPx5RUPp+mKWRwd2bJoI3ralSgBmcxmQF
         EnNq8MrfAZPRBr00KJUfHKaYWSaZ6hvMag9o4Rmdweag3FmL139PLJbhqrPT74hVGx
         6i3t1CyWJtMPQYDbF7xxIapSj1xUi1Kr9K5mFXp2N6RadK2/IrUge3MGLTmoQuEnC0
         mrAinDIsJaXTroP2r/dtUeAJfLoEdiltUSBDQNoVofFLB8q2TFZVT1c2r6sETimaIc
         NfKeOjDFLeaeAY7R5ltNLh4aOi8xUKBQTHwhlSaTeLrmDtw83MsNXI7V/qhCJSorvR
         Bv1gcTLUSEIIQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vidtv: move kfree(dvb) to vidtv_bridge_dev_release()
Message-ID: <d33fd5c2-6254-9761-b44c-9bdfd32efea3@xs4all.nl>
Date:   Tue, 14 Sep 2021 09:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPGVVHSpBQCiXCa9Jk0GjouToY8nBOytdrSo4F5Pbja0nY/MuMv/rsRhO7gF7AU8mcy/ggLT49bvOU3PhChNz+yBzsqiRPWG2ZgHjbcyMsISPn8caOMg
 O17dDglacBqoP9Bs9O9ptzZ8Q5RQoeTOFpFSF5fl5AxDiRE1rea3mzjDZYFYMpWyTqFMA9niL1JzA03rZR+iRZPgQrzNrKog6oaG53ZHpwvMD7ODTvQE+IHM
 L/df6OFyveJhpFF7G0AUymRmxPMTjEEQnZqZ7JF3sYJq4d5RmB+e9XrBY5pL/ZOlbYnN8nLzwBUGGd2KWDh5W0+6rMxQbi375z3/79Iyf54=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adding kfree(dvb) to vidtv_bridge_remove() will remove the memory
too soon: if an application still has an open filehandle to the device
when the driver is unloaded, then when that filehandle is closed, a
use-after-free access takes place to the freed memory.

Move the kfree(dvb) to vidtv_bridge_dev_release() instead.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 28bcf7de1bfd ("media: vidtv: Fix memory leak in remove")
---
diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 0f6d998d18dc..82620613d56b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -557,7 +557,6 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 	dvb_dmxdev_release(&dvb->dmx_dev);
 	dvb_dmx_release(&dvb->demux);
 	dvb_unregister_adapter(&dvb->adapter);
-	kfree(dvb);
 	dev_info(&pdev->dev, "Successfully removed vidtv\n");

 	return 0;
@@ -565,6 +564,10 @@ static int vidtv_bridge_remove(struct platform_device *pdev)

 static void vidtv_bridge_dev_release(struct device *dev)
 {
+	struct vidtv_dvb *dvb;
+
+	dvb = dev_get_drvdata(dev);
+	kfree(dvb);
 }

 static struct platform_device vidtv_bridge_dev = {
