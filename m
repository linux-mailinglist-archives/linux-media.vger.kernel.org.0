Return-Path: <linux-media+bounces-58611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFE9J2rG22lHGgkAu9opvQ
	(envelope-from <linux-media+bounces-58611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 18:20:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0E13E4B96
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 18:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7502300D72F
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 16:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006F62DA76C;
	Sun, 12 Apr 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDd6i+hn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD66279358
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010845; cv=none; b=dusDv2UFowuPWuB9To1j9m9LfuHCx9aqg/Fx4jOxH+k2U0N6EDSamP96ZMEWbH1IdVeG9vsQpRsq1Iu6Wv2wJQ/PzTE9NsD5DiQplFUQ/S6Hwuq1xNu7Y2SqMGlWiFao+LiCccLiMetI7ze/F84evs9Sg347oIncd016p+6RULE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010845; c=relaxed/simple;
	bh=IXU7VR31kF/neD4v+Bkd2iRSmHPEdii82eltHZEW8HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xnnxkt8UsmtjqDmstHpNfQv70YkrnHsPsNxsozZO8U+ppdwhcxvhB5JGiKJM1UtAIGaZiu3hKar/WYGjEFlk0MR1OatXp1Foale7zUkjAoMzCGVPfAuvEjOShE7i5BJvSm9bgk4tF1ukBciLmQPxGl5SGikExjNDRv813J7uw7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDd6i+hn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so35471235e9.1
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 09:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776010843; x=1776615643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EctM6aa/31bwuVLvZQXQE4KkAQg00E77yvT6KhMiPOY=;
        b=XDd6i+hngAj712aTdJDIGw3KSjBY/D08ECygD9yjeWB8rr7UYL37uRMPod2TOXIaN9
         n852jHpR+0fcwO9zYPcGkGFqrEV231jN1v8xnuJr6iipYh5G4wkrjX+HnB9H38wToN2m
         9+o9FWZWvZXK8vdPYnjBMmfmO1jzsW5Q0F5NkgSmZm/nge20npKMdf3HtWNe4rAKcnjc
         GLn9k+Nvot0JxmyHJKYIK/IZeWc3a/Nk3t+jNL1yvMoWPgai/t3SjzV1GhlDjemNOKol
         lVEcOox7pL+lPzyHhfW6EELE2tUjSvNfyITGhj9jenVF0kQ6az1SUt7QoOEr+ncrgr8/
         G9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776010843; x=1776615643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EctM6aa/31bwuVLvZQXQE4KkAQg00E77yvT6KhMiPOY=;
        b=jFkYbDBif1K0S1w353SZXPwTusLmBTMiz87JLP73zWW69CX836TBKKxTlxMejsLl0I
         6ponas01dhEGi51gKgGRIOiaBEzJoH3mjwsCubEhMWNcuxvwydHvVnButTVHEGB3ycUm
         ayiNTuYDV0A0jxIEqR1hPAbYGgPdLJSGDU6JD9aiLoFZX8tr2DPHfaX0DpFQvHp9U7EZ
         ENihdJBKh9pEJL7TzuteQlPBg6SqOeVB5fZvA+2BVDKLP7ePlqDnLg0e1xFw2mAghwrt
         inGS5WueLuEMaO6FbNBpieoIhWPbyyYsNALNwt/n4afRWAJAa0JpOhuoWEK+I1fym98b
         0i/w==
X-Forwarded-Encrypted: i=1; AJvYcCXFMsQAEA+cLISXZNgHRvzAYCOs0jKO4ztxJ2L8klB5mV7z6qh1f3ElL6uP4sNQVp8daqx2hjsNMDX6qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+kyRmHLPy7UvHsk04yaoW6CBpbINvDIBUyOah8DmaCFXDH42d
	Krydv7cIuJJbhgf49grXFll2UnRGB1YCuI/TtqKxaTf4tXm+AYOSxJSWEiN0ZAnoi5U=
X-Gm-Gg: AeBDietNM7vJbbwuj3Ns+zPwqOYuz+8FxzpdJFSdDPM7tplqmC7XJRaob0jO4p+Eesc
	KCITInOylyb6tRnPziXdlSIHiAXUaA+dQ8gPgUAgO8L4yDRiJ8ngvCI6k0Xh1a6er5joR42UHwD
	WiSzi2sRvYI41CfPcChU/iGZfXCS4c3GldC+fAYaFFKgl0dIO21p2U/76HAy1STGliIKgZ4v6Zs
	UBnkVbr2jbEP2mOsPsELdFy4FflN9G/seht9g9B9JGlZo2S+Drm3jtJBOAKduNrN4rZQb1EqgiN
	JLnmRSYPPVcoqXveOtP+1qq0D5wk5iZvGgtgtUPzFrt5FoofwsZtX3bb4uif1bOZ2DAiWmUIPsF
	kPFK1ZPM3Som6h7qR3fL4KNII0n1n86O1lNkvsd3uDkqkzU96DVGvGN/7fU07K0RsaoNHJXY68/
	D+NdnV8BD2c7elhmxUZRFHjiTuorh14A==
X-Received: by 2002:a05:600c:a109:b0:488:a977:8de with SMTP id 5b1f17b1804b1-488d6839866mr97614455e9.16.1776010842441;
        Sun, 12 Apr 2026 09:20:42 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1ccb:26a3:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f1f9sm281754745e9.1.2026.04.12.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:20:41 -0700 (PDT)
Date: Sun, 12 Apr 2026 18:20:39 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] memory leak in vidtv_psi_short_event_desc_init
Message-ID: <advGF8eFp3on-6hb@gmail.com>
References: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58611-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,afc686a471d70896c5d9];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 4C0E13E4B96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

#syz test

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..fdd9fa5cc24c 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -901,8 +901,14 @@ static int dvb_dmxdev_add_pid(struct dmxdev *dmxdev,
 	feed->pid = pid;
 	list_add(&feed->next, &filter->feed.ts);

-	if (filter->state >= DMXDEV_STATE_GO)
-		return dvb_dmxdev_start_feed(dmxdev, filter, feed);
+	if (filter->state >= DMXDEV_STATE_GO) {
+		int ret = dvb_dmxdev_start_feed(dmxdev, filter, feed);
+		if (ret < 0) {
+			list_del(&feed->next);
+			kfree(feed);
+		}
+		return ret;
+	}

 	return 0;
 }

