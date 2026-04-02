Return-Path: <linux-media+bounces-57982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KejEUW3zmmTpgYAu9opvQ
	(envelope-from <linux-media+bounces-57982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:36:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A138D3EE
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CC99305ACA1
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 18:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690A537C900;
	Thu,  2 Apr 2026 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjgAYgli"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A9737AA6C
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154732; cv=none; b=Sxtot7ythP/XB1AKBkK4Hgi4JFDz150Gnmrx5ajVoNMuFaIpZ4OS7TFBc5Q1RJcnd5pqByWXXruZVhPRL7AJ8NEyfW8/IzoPjF82kg0gS/GWvdzHU69WCmMLAlZsKwyvfSwg5Edy+mi519v23JWcBiOm+k6LfjTSNx0ftdtmHiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154732; c=relaxed/simple;
	bh=A7rPbhe9tHHV4d32kmPILTC+TeE/L3PdKVHCOt46Bvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPZnYDi0v4KTb+Vq28aCauCz3B6BnqdrxXxUKctJOJoSPwi1/VV4zGUN6t1wYk0hmHUvj52HKJoola6veSjFO9u8IK0xB7XxMgOlhEIowEe4G1a7vkJi0pgPx/Zk+kTVgrQ0iQNUiwdy1upsEovJ4L1nIpYXDvdRg7NEtDtIMzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjgAYgli; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-46aa216a5edso721291b6e.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 11:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154730; x=1775759530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+5HXFm4K8EljZXquMjN18Vn+rr53ZK3oDrIhR9XX/Q=;
        b=WjgAYgli0ZEdBBt6gpMBnmA5Wu9DdEq36MA2VPihvjSAU73blYQBa16R8f+4k50IRZ
         xaShqedrqWkK6JNW+LnVKnaZcFoNlfY8BxOp3Lwe1BEbbasVxHwoyqfyPo5ogKWYHVx6
         5IulvpQuEDe91QuEb/Lok/oso2bqrfkeqxdLAphTjytRaFKOSm6pJrB+I8kcOUvbHHi1
         HSOAM1AK7dX/SWvc6X7CxEVomdD7VG83IzvuGG5qXbzRAl1U13Y+BdchhpU1B1HbmlM9
         qBeIdhf5um2GNOWobG8zmynjH2aqpcdc7Mk7qArAYqXj1a/Wly0P9IwtOd8JjKmaAkQ1
         pjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154730; x=1775759530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+5HXFm4K8EljZXquMjN18Vn+rr53ZK3oDrIhR9XX/Q=;
        b=ASaeBPNTyktfmp+CS0aRXYGiCrkkbOoYJ8/qSNbQIKY5ahkbNDmTODs3xMitgK1XMX
         XR8FqTg70LcjTtnIXuOcoxt0PkCkMoMbIzjwALos4XWTItXbsMO7zB8w5787LLrrZleo
         v6FMazv5cBjYXAuPV+IxYBqLzDVLZ1hCQaL0HGFadpJ8rsDJ7UB7C+Wrw2dGrhDVrSVv
         DYyOpoiqtB8HMb0KorakQVd72uaNW0hV6YCzRmJpmFppbxb5UXHm0dbKw74UFFkqKIVy
         RBtb45dA44Wmw32clFbe/HltvS35At20jjCk9m9PFlqxhEbX0KCe040a7xbP0DI4yxFl
         4XNA==
X-Forwarded-Encrypted: i=1; AJvYcCU45fmdERSU8izI8u2/G8RK7EEUti2RblkwcnFypqNVB7QWBmxW8Y+3DFvivL3itdOT7FhuQTOnBdiXuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAHBt0W381RVgIo8aw27O+L1Sg7ifGfEfTcq3eDXaWSVxW47d
	LjLB4dsG7buqI03gRXNA3HOtJn3lRS/w2G/jvHTUCGJZwXaaF72euWMO
X-Gm-Gg: ATEYQzxhj+bLb5tNWf2CS9Zvb368v2AbMhpvJUqpjAYDZoDdV+eyPeIexIc2zwCE5tL
	cmfkCxnmxa9bNPoDvjbLYHZ7QYth2y09b6M9WgDau/jRx+ID42SmY/qAbCi/VEKAG5Jcmo7dVmR
	nQHXSLOwhO2D5x44cmI8GXnDUFUsGjBhh7P1hE2PZd8x7DqAJaley+bHGxqlww80HYydkStQyXM
	5/VVbefjLmfsafE09p7Qe2cKcCPPksO47XGrJydSXZVRUgde/S8GFO5NGfTVrliTKNs34exJEmi
	dA4OfZ6FBxEAwsPbbY/YHzgJPrF9bCjXX4G0+BQPLoAbkspsImlG4QStoJ0eaQ3q/8iKmLntTDA
	H8FiZGChk+pBUuKUl+xTZzfyeyNWroa6NC6/pn1LGJVG/mi6GQuclUrY639oIIV+XlA7acfqTsB
	G1a12tDMlFEc2gNTL8G/jFgUytyzHtCXJ5AFKQ3xYELKm057dm3bGyBSuU+QW6rd8wUmJmN1k=
X-Received: by 2002:a05:6808:6618:b0:45e:f0af:5148 with SMTP id 5614622812f47-46ef791a130mr217257b6e.30.1775154730369;
        Thu, 02 Apr 2026 11:32:10 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba72fcb47sm2720585a34.15.2026.04.02.11.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:32:09 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	stanimir.varbanov@linaro.org,
	threeway@gmail.com,
	vikash.garodia@oss.qualcomm.com
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Thu,  2 Apr 2026 13:32:09 -0500
Message-ID: <20260402183209.27159-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ebzdn3aplm76xkvljwpg6v4mid7ljslhzwnf45u4obgwhcnckh@rtdv64on3y6b>
References: <ebzdn3aplm76xkvljwpg6v4mid7ljslhzwnf45u4obgwhcnckh@rtdv64on3y6b>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,linaro.org,ixit.cz,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57982-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F2A138D3EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

> Thanks for the additional testing!

> This might be:
> - A bug in the firmware
> - A bug in the Gen1 support in the Iris driver.
> - A bug in totem (heh).

> Would you mind sharing details, which video were you trying to play (at
> least, the codec that it used, please).

> Also, does it kill the playback afterwards? Can you start another
> playing stream afterwards?

The video that does not work seems to be 

  Metadata:
    major_brand     : M4V
    minor_version   : 1
    compatible_brands: isomavc1mp42
    creation_time   : 2025-08-04T19:42:21.000000Z
  Duration: 00:00:35.24, start: 0.000000, bitrate: 6291 kb/s
  Stream #0:0[0x1](und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(progressive), 1280x720 [SAR 1:1 DAR 16:9], 6126 kb/s, 23.98 fps, 23.98 tbr, 24k tbn (default)
    Metadata:
      creation_time   : 2025-08-04T19:42:21.000000Z
      handler_name    : ETI ISO Video Media Handler
      vendor_id       : [0][0][0][0]
      encoder         : Elemental H.264
  Stream #0:1[0x2](und): Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, stereo, fltp, 159 kb/s (default)


However, a video that *does* work is

Stream #0:0: Video: av1 (libdav1d) (Main), yuv420p(tv, bt709), 1920x1080, 23.98 fps, 23.98 tbr, 1k tbn
    Metadata:
      HANDLER_NAME    : ISO Media file produced by Google Inc.
      VENDOR_ID       : [0][0][0][0]
      DURATION        : 00:05:16.732000000
  Stream #0:1(eng): Audio: opus, 48000 Hz, stereo, fltp, start 0.007000
    Metadata:
      DURATION        : 00:05:16.744000000
  Stream #0:2: Video: mjpeg (Baseline), yuvj420p(pc, bt470bg/unknown/unknown), 1280x720, 90k tbr, 90k tbn (attached pic)
    Metadata:
      filename        : cover.jpg
      mimetype        : image/jpeg

I do not have a ton of videos to test, so I just used 2 that are on my system.

This is not just with totem, showtime shows the same issue.  If I let the video
play, it plays just fine, however, if I attempt to skip forward, back, or even
play *after* the video has played, then I see the smmu fault 

 arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
 arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
 arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
 qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:1, data2:deadbead)

If I exit and re-launch totem, it will play the video through, but again, if I
attempt to skip forward, back or play once it has finished the video, then again
the smmu fault occurs.

totem and showtime both use gstreamer, and show the issue. showtime replaces
totem as the media player on modern gnome systems.  mpv and vlc do *not* show
the issue, but they also do not appear to use iris/venus at all.

Totem is version 43.2-11
Showtime is version 50~rc2

Host system is Kali, which is essentially Debian Testing.

-- steev

