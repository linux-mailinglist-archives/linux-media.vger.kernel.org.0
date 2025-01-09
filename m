Return-Path: <linux-media+bounces-24500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59510A073AA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 11:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 333A47A2C44
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D32F215782;
	Thu,  9 Jan 2025 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="nL1KVN0Z"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5442594BA
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736419677; cv=none; b=J74PTgrAYU3gZlnzvDyMMHJ+kGylGWE7o2Nwa4xCwZ7ns5+yiSXN1tHbOXWm02zzpxTMyG+Tyy/lVwyiNXqEzTvQiCAIu36DNyfkXEkEdZcPfSNuGRB3ZiKzkDTkO3lAPzYL0VMVZ37bGLN8mV762OD9wDjDw/B9A8akkHC+2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736419677; c=relaxed/simple;
	bh=PjZ/urAxiyNZ7NgXvSG8MQiEq4hf2HxALYOm3iBOOwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdBsxItO0JeoGN9Aqe5RtnmUt8b8Op4f0DkMqBnOuKAtZfMiy9dF8pqFxHMCurF9+FaxbgiyFsBiiKsTMYAxz2FLsZTSKqovQo5J/YT5tYWWp00jUrpheVzKBAvV7IrjpBDy29JeNw6AOX8QhVKfN0FgtQ1tHQLwWAYr4wFHtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nL1KVN0Z; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SdwjScrjmqb5wrguRd98XUCwFwEiGYVWwrdFxpchtIw=; b=nL1KVN0Zr1MGAvod1nq9uSp5X4
	KaTxrUsMMCtqvRJ9rRKLXp08dIcOnjfMXvyviJUDODYM9IKMyLmNlLyivJfJslQg0ZLcTS16Dkbqe
	yq43Crc1TVzxH1dedUftX+oJSPOP2XtXEQUuRZdQ9ahZG6/q89SfcuD/iRVrVMG7OQOmXmk9iPPLE
	a7PCKDRfpEwoyxMesLGw7bFdlUzYM8wDDDpS38JnTqo1lbhRGFpvVsSlZxF0ctov0Cfcp/KP3gJvK
	xuNSYsPaBVll7zEtrpA1uL9Q+tXQECQjcMZLRASEg/NZEaXteiwrmcDNhrLRnB5eMU1MHJrZhKlFy
	hc6NyPvQ==;
Received: from 179-125-71-237-dinamico.pombonet.net.br ([179.125.71.237] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tVq4j-00DWCL-0A; Thu, 09 Jan 2025 11:47:41 +0100
Date: Thu, 9 Jan 2025 07:47:31 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tomasz Sikora <sikora.tomus@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	hverkuil-cisco@xs4all.nl, kernel-dev@igalia.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	ribalda@chromium.org,
	syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] media: uvcvideo: require entities to have a
 non-zero unique ID
Message-ID: <Z3+pQ/xVdpiE/1GN@quatroqueijos.cascardo.eti.br>
References: <CADBf=5nJVddk-yPVw3T5GH9JEPOxnO8McPJHaxtnPBvLCnp42Q@mail.gmail.com>
 <Z3u2vHFVPYTmCnwj@quatroqueijos.cascardo.eti.br>
 <CADBf=5nS8_cQvG3mRnXe_MGYmFMh=Myf_eptPqN9hgNMu73Wjg@mail.gmail.com>
 <Z36ad0OxZBnQ0Kxx@quatroqueijos.cascardo.eti.br>
 <20250108153637.GE32541@pendragon.ideasonboard.com>
 <Z36gMvN0XxfXwE82@quatroqueijos.cascardo.eti.br>
 <CADBf=5m0WVMJbVfDvpFdqoYdKj=nT+mOW=D-Q2MJJ=TCbsTMuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nwQemdKUjYgXQ6Qm"
Content-Disposition: inline
In-Reply-To: <CADBf=5m0WVMJbVfDvpFdqoYdKj=nT+mOW=D-Q2MJJ=TCbsTMuQ@mail.gmail.com>


--nwQemdKUjYgXQ6Qm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2025 at 11:14:28PM +0100, Tomasz Sikora wrote:
> Hello,
> you right
> I have in dmsg (line 1228):
> [   12.981124] usb 3-2: Failed to create links for entity 5
> [   12.981126] usb 3-2: Failed to register entities (-22).
> 
> full output in my log.
> 

Thanks, Tomasz.

Can you test the attached fix? It should still keep the warning about the
multiple units with the same ID, but now it would not return an error nor
warn when registering the entities.

Cascardo.

--nwQemdKUjYgXQ6Qm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-media-uvcvideo-restore-support-for-non-compliant-dev.patch"

From f771f5c4657ed25ae36784bf13992ddbee3161e6 Mon Sep 17 00:00:00 2001
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Thu, 9 Jan 2025 07:37:41 -0300
Subject: [PATCH RFC] media: uvcvideo: restore support for non-compliant devices

Some real-world devices have multiple units with the same ID. When creating
their media entities, it would lead to warnings and failure to create such
entities. However, the V4L2 devices would still be created and work.

Restore their support, but still warn about the multiple units with the
same ID. Avoid the failure in navigating through the chain by storing
pointers to the entities instead of only their IDs.
---
 drivers/media/usb/uvc/uvc_driver.c | 16 +++++++++++-----
 drivers/media/usb/uvc/uvc_entity.c |  4 +++-
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1a22364f7da9..dd81067f8d30 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -791,10 +791,8 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
 	}
 
 	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
-	if (uvc_entity_by_id(dev, id)) {
-		dev_err(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
-		return ERR_PTR(-EINVAL);
-	}
+	if (uvc_entity_by_id(dev, id))
+		dev_warn(&dev->udev->dev, "Found multiple Units with ID %u\n", id);
 
 	extra_size = roundup(extra_size, sizeof(*entity->pads));
 	if (num_pads)
@@ -802,7 +800,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
 	else
 		num_inputs = 0;
 	size = sizeof(*entity) + extra_size + sizeof(*entity->pads) * num_pads
-	     + num_inputs;
+	     + num_inputs + sizeof(struct uvc_entity *) * num_inputs;
 	entity = kzalloc(size, GFP_KERNEL);
 	if (entity == NULL)
 		return ERR_PTR(-ENOMEM);
@@ -840,6 +838,7 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
 
 	entity->bNrInPins = num_inputs;
 	entity->baSourceID = (u8 *)(&entity->pads[num_pads]);
+	entity->source_entities = (struct uvc_entity **)(&entity->baSourceID[num_inputs]);
 
 	return entity;
 }
@@ -1503,6 +1502,7 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
 				}
 
 				forward->baSourceID[0] = source->id;
+				forward->source_entities[0] = source;
 			}
 
 			list_add_tail(&forward->chain, &chain->entities);
@@ -1586,6 +1586,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 				return -EINVAL;
 			}
 
+			entity->source_entities[i] = term;
+
 			uvc_dbg_cont(PROBE, " %d", term->id);
 
 			list_add_tail(&term->chain, &chain->entities);
@@ -1620,6 +1622,8 @@ static int uvc_scan_chain_backward(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
+	(*_entity)->source_entities[0] = entity;
+
 	*_entity = entity;
 	return 0;
 }
@@ -1783,6 +1787,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
 			goto error;
 
 		prev->baSourceID[0] = entity->id;
+		prev->source_entities[0] = entity;
 		prev = entity;
 	}
 
@@ -1790,6 +1795,7 @@ static int uvc_scan_fallback(struct uvc_device *dev)
 		goto error;
 
 	prev->baSourceID[0] = iterm->id;
+	prev->source_entities[0] = iterm;
 
 	list_add_tail(&chain->list, &dev->chains);
 
diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
index cc68dd24eb42..7f42292b7fde 100644
--- a/drivers/media/usb/uvc/uvc_entity.c
+++ b/drivers/media/usb/uvc/uvc_entity.c
@@ -36,7 +36,9 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
 		if (!(entity->pads[i].flags & MEDIA_PAD_FL_SINK))
 			continue;
 
-		remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
+		remote = entity->source_entities[i];
+		if (remote == NULL)
+			remote = uvc_entity_by_id(chain->dev, entity->baSourceID[i]);
 		if (remote == NULL || remote->num_pads == 0)
 			return -EINVAL;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..a4ee79e4e85b 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -239,6 +239,7 @@ struct uvc_entity {
 
 	u8 bNrInPins;
 	u8 *baSourceID;
+	struct uvc_entity **source_entities;
 
 	int (*get_info)(struct uvc_device *dev, struct uvc_entity *entity,
 			u8 cs, u8 *caps);
-- 
2.34.1


--nwQemdKUjYgXQ6Qm--

