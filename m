Return-Path: <linux-media+bounces-42175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B523B51410
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7CDD1BC54A6
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BFC261B95;
	Wed, 10 Sep 2025 10:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dKrswrQq"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10136221264;
	Wed, 10 Sep 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757500324; cv=none; b=tpByrJNWPTleU5CGuTd+efQyG5WNYlVc+EdYn13FSnMLi/4vmk0PZW/yD2dwoPePTyEdiMPX4IjXbI3kVNUl5AAIpk89qMr6dMf1As232/S+62DadwvHd/8fhAQqaJ7J5dE4g15RlKmNBHG3lWMxAakO7pynPCOuyVdbdygAdqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757500324; c=relaxed/simple;
	bh=z2qz28yNyjkG+xrxlSZq3R8Bk5rNMBLLLeQAYQ5H1Vg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=IHgc30VFQGGLEArC4j5t4xYiMfdBvvB0NQmoDBDZsbQmrt1K9Lyqh2mn/4lbBKOigK/iyCglnebI+bIqvsoqIONbgxNDDAC/jsRdMTVd19q6ECGsozYvtsMToDcjWldOrRzpvEEdkh5L99ehTikn1Zm3F2HK0h9AgnabTVGOMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dKrswrQq; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1757500316; bh=onjYSwH9bsacq9buL1dfzdVKZsNWxs2ysYx73K2dtxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dKrswrQqkmiPVkYHTYzDvotXgSZ0USXNMM2K9/aVK15hpFl1xi/MM8jLEPsCyox6v
	 lCb2OEZuwvd2y/Rn3SiNDQ9+RO6iAeR2d/5YUSj1G2apCi264DTlUH4Tk656MKuZXB
	 VZ0Qb+Ikm/83ycu6eOeGkpeeBy7BSApH/xttfYUk=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.230.220])
	by newxmesmtplogicsvrszb42-0.qq.com (NewEsmtp) with SMTP
	id 7F48DC6B; Wed, 10 Sep 2025 18:31:52 +0800
X-QQ-mid: xmsmtpt1757500312txzopz5d4
Message-ID: <tencent_3DA367CA06CB92C5C64C49A4AED42ECA4C06@qq.com>
X-QQ-XMAILINFO: Nfm/+M6ONQ57Nz6EDvucQ86xDqv6/4QIfM0Yy7YTjPZFbsDay/5j/gkssNIj7B
	 eiAV5KNODJRqB/SldeHZRI6sxwG+vPhsF3OPjhRnGI+lT6PFHHKByNhW26oZ22nZNkqfKHIkl+qU
	 /weNuPEv3nHmLLR+Ic+ljNi9/Ea9GOW9AUvZgyNDEGEmCW/kHvuI1PNY2wbWLyP1EXik2Sd+q6w/
	 FgVnIRP7nSzq5aAKyyl/9ALNpTkzjCkqqzvtLBI8WTuyNJi113ugFcO8kVRAkqu+9IOZzkKqCCPv
	 YeQG53+7ypSGRy2PwtsolxmArMHopqeEMqQZImhnVm47lMGueVMbXs00bRKWB1ijrP+T4vblo65A
	 B64i5WC7b2bZuT3y/fTkDZaTiq5MbJU9Xifr2caFkeMBwfUbQXnMMRrlEYk5XBHxf+dgW7zSNnmI
	 kXyQfaEaNDWK4ZKxZcUD0GSBUECT3S0N4Yc87UzM7cJznu0p7wvydkfzwWphm3eUSLDzWH40sM/f
	 68WSuMRw8TteYvEGRNRZ7XzgR6p2c7NryztmYGae9RA82JwhTs9Ca95r0fddlpZA9eVZGm/4Sqyg
	 MYp0QyX9V4l9j7oB8hbjQwYR5vmX95oFrtS6Y8/yNvHkR4vF6WKIN1r7XyEM1Uba9DosaTEQQkq9
	 jkLZNL4IqcxYqUHUd1ZAKCcfeStAyYzAt56TspVlXIUEwlXhmQno+KsBWv/KSNdCAUfbciE/GH5w
	 9GSmvunDgOV8egUtSFul4ify0SKyaZcOmtNKGPKQkGE0WQaiH3exbCkYemgN7ORXuGB9z27BO36+
	 EOpfZKjat5JFKqqZLtsYSUakDT88yfxT4o2aMxKVb+vJhPCfcPGp6doiW247Pc7M8oGHNORwiZh1
	 56exs+TTC+7T/ZLFbK1MnWIyuP0ZvYjtLiWlQ8fOgvrRO4t+a4a4QL4z+THGX9LHKIt7G0GhHJNK
	 LvY++cvwS+vRDBoMSHFwW+MKSH73N+qQkn9C90zX0/0SwssP2earNg/9WZbqku6QPOkcAGk2z7mN
	 VMeZPiHQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: laurent.pinchart@ideasonboard.com
Cc: eadavis@qq.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH Next V2] media: mc: Clear minor number before put device
Date: Wed, 10 Sep 2025 18:31:45 +0800
X-OQ-MSGID: <20250910103144.1680860-2-eadavis@qq.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250910092233.GA20904@pendragon.ideasonboard.com>
References: <20250910092233.GA20904@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot report a slab-use-after-free in media_devnode_unregister.

The following calltrace shows the entire process of UAF generation:

hub_event()->
  port_event()->
    hub_port_connect_change()->
      hub_port_connect()->
        usb_disconnect()->
	  usb_disable_device()->
	    device_del()->
	      bus_remove_device()->
	        device_release_driver_internal()->
		  __device_release_driver()->
		    device_remove()->
		      usb_unbind_interface()->
		        em28xx_usb_disconnect()->
			  em28xx_release_resources()->
			    em28xx_unregister_media_device()->
			      media_device_unregister()->
			        media_devnode_unregister()->
				  put_device()->
				    media_devnode_release()->
				      kfree(devnode)
				  clear_bit(devnode->minor, media_devnode_nums) 

[1] kfree(devnode), after this code is executed, devnode is released.
[2] clear_bit(devnode->minor, media_devnode_nums), this accesses the
freed devnode, trigger uaf

We clear the device's minor num before freeing devnode to avoid a UAF.

Fixes: 9e14868dc952 ("media: mc: Clear minor number reservation at unregistration time")
Reported-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=031d0cfd7c362817963f
Tested-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
V1 -> V2: update comments for rootcause

 drivers/media/mc/mc-devnode.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index 0d01cbae98f2..6daa7aa99442 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -276,13 +276,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
 	/* Delete the cdev on this minor as well */
 	cdev_device_del(&devnode->cdev, &devnode->dev);
 	devnode->media_dev = NULL;
+	clear_bit(devnode->minor, media_devnode_nums);
 	mutex_unlock(&media_devnode_lock);
 
 	put_device(&devnode->dev);
-
-	mutex_lock(&media_devnode_lock);
-	clear_bit(devnode->minor, media_devnode_nums);
-	mutex_unlock(&media_devnode_lock);
 }
 
 /*
-- 
2.43.0


