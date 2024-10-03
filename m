Return-Path: <linux-media+bounces-19037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3FA98EE22
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 13:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40897B2300F
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 11:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FCC1547ED;
	Thu,  3 Oct 2024 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ribalda-com.20230601.gappssmtp.com header.i=@ribalda-com.20230601.gappssmtp.com header.b="V8ABRIB8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7722310E0
	for <linux-media@vger.kernel.org>; Thu,  3 Oct 2024 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727955015; cv=none; b=l/t1qFVR/qqsMI0fSCbB32mxZyWXHlPoJNY1R3svG0kgn8wDO+kC7ne0zOInryNjEktuO0hD+itUKuJSD9ke1Jxp8+86zO5W6nZ74qEQmwJNhjtOUE0zyPiTP/AaYmwNwcx6Bsup3WW9Qk5ccp9l7A5RaqaGS3+89X3RyZ8sfio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727955015; c=relaxed/simple;
	bh=9/h0WYX1d5VnmBKt83pSP+z1QiT36uKU3Gk5NVfc+wY=;
	h=Message-ID:Date:Subject:From:To:Cc:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZDNFoKYGv2X84vdMt62t6uVdeTJBV5ZjVXc1HQTtzeSPLH7tklrly9XjtwKyvsBrOfGVEnHOxHX+A0xNbkyQfG8pUKQBwmFq+tIscbslzDMqsDeGVVvNodt73o/eQXnJB/GEigBt7DTFL3V9oORuEL19kBinqxbEetZcHjDdiWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=media-ci.org; spf=none smtp.mailfrom=ribalda.com; dkim=pass (2048-bit key) header.d=ribalda-com.20230601.gappssmtp.com header.i=@ribalda-com.20230601.gappssmtp.com header.b=V8ABRIB8; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=media-ci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ribalda.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-82cf3286261so37104139f.0
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2024 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ribalda-com.20230601.gappssmtp.com; s=20230601; t=1727955012; x=1728559812; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/h0WYX1d5VnmBKt83pSP+z1QiT36uKU3Gk5NVfc+wY=;
        b=V8ABRIB8lDB7ASUK1SkGo2mIs6YLXQ0AmoAj+qg9PHl+vUGcDfz/DrnGQbnZdFBrzW
         E/g/sToZ60Jmq9DzdntfkabMe+21KC3dEQd8p+oRbNpgI88Sofisu3d8PRokGlC8Mx9d
         KZjWKjR0pXHP+sc7zbaGG7PWNVnSCuQDC7qmT+t4W2dWsRb4VA8meVwJ7k7XiS1VIj4D
         Nm7GchFmwIJUcWZwm4kibXPIgJLjOvCk0kTBbcHyU8v3UPVjRjiOU7k6ZDKX+uD9qbmL
         nfLSW0ytOZ0biTzSalUDCMWEM63XMgB+SFMiVFTDIogI7NTnoZ6kGxqtQ/NuPpqpUmsa
         GQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727955012; x=1728559812;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9/h0WYX1d5VnmBKt83pSP+z1QiT36uKU3Gk5NVfc+wY=;
        b=S2ySR7XJuGvSAo+Kiau2rG+Sg7rcAMJvgykUvuxJHamhtp7e/5aK9SJzmJloL6TLsC
         mRcAB4EJyaMSPJ4BoUvmb2QHHd2szErj5nWubHWLw4MwwO7UzvSs/Gm0vLs+SM2pPGb6
         tlZii4rdx2pjNsu2B+S5QM3h7mXIqT0VuGqmcoTL68h2GvbYDp3STfQPgS5xJYJME+GY
         1/OojQhKyyL60LD5hG2SiZrIdccA158fiqdU9PlJgoCJhjyK+N06E493lr2SKDH1mk0/
         n5nMvd1lBFCS5ZBbS0Z1u99T3ELi38ezWNGYEs8s9mJw04mHZyNgxjzRFKByOSSOMZYT
         YcDQ==
X-Gm-Message-State: AOJu0YzPEd/m8jSLRYdz+Jzf/JlxsXxmcV2zrJ4Xfr+UMJ+97zRVRPva
	H3TnWW/bo33N5gjAQ4nkYEQ+N5I+BELpuRVHklndK97/owFO3aO7AhIwgZL6DxrM1PQgBhG6NpK
	s1caUaniw
X-Google-Smtp-Source: AGHT+IHZe72LNMWHuiEoyjw++mcLZk8XE33RNCsyJDh9av07G+a/OdPp4n5eA05v37GJwoxYJ+l4jQ==
X-Received: by 2002:a05:6602:634e:b0:806:31ee:132 with SMTP id ca18e2360f4ac-834d83f7467mr617106439f.4.1727955012428;
        Thu, 03 Oct 2024 04:30:12 -0700 (PDT)
Received: from gitlab-scheduler.us-central1-a.c.linux-media-ci.internal (35.232.27.34.bc.googleusercontent.com. [34.27.232.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4db55a6404csm222790173.99.2024.10.03.04.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 04:30:11 -0700 (PDT)
Message-ID: <66fe8043.050a0220.f9c46.044a@mx.google.com>
Date: Thu, 03 Oct 2024 04:30:11 -0700 (PDT)
Subject:
 re: [v6,1/4] media: uapi: Add meta formats for PiSP FE config and stats
From: patchwork@media-ci.org
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20241003-rp1-cfe-v6-1-d6762edd98a8@ideasonboard.com>
References: <20241003-rp1-cfe-v6-1-d6762edd98a8@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Dear Tomi Valkeinen:

The unreliable Media-CI system has found some issues with your series.
Check the report at: https://linux-media.pages.freedesktop.org/-/users/patchw=
ork/-/jobs/64591858/artifacts/report.htm

Please fix your series, and upload a new version. If you have a patchwork
account, do not forget to mark the current series as Superseded.

If you believe that the CI is wrong, kindly reply-all to this email.

Best regards!

