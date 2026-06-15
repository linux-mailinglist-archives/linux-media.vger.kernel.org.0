Return-Path: <linux-media+bounces-64900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MRDNL77RL2rGHQUAu9opvQ
	(envelope-from <linux-media+bounces-64900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 12:19:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4C6854F8
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 12:19:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=DTg0wa+2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64900-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64900-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B4F6301CC3C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE9930C17B;
	Mon, 15 Jun 2026 10:19:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E433A71A
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 10:19:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518775; cv=pass; b=DXBDd57tQEYCcoKl41qwJkuUmXQ4ixkUUpnUgjThwd2osPojs4TXRCfQxsTCKjUgqnq/R4rU796qPgOC6eipvjMrgbfQoXD7orCm2wYF86vfKhT1ZWEkkXhpxnNUe1+XqfjPVUrrMd253a9MwYyFkThtVy1F1rhoL47cHzuGsfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518775; c=relaxed/simple;
	bh=5p5y0u0+RhuWJIfLWQKgNya+WX5HjUfyMDbDnrM2yUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ud5b/T3d9WZqb371IYyEJ3mFxF+yxS2MRYFBeKHV4hnI1+L0Wct+SUCtjEoVjaiQK1JdOfOYgOT8MLTAT/+bGWrPyoi4gqmq37AVFUinQp2xhR0xIB9tgNtOeeC2ndZglxXu80+Kj0yunFVT7EfbhWkrjWW5OMomizMgR38l3Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DTg0wa+2; arc=pass smtp.client-ip=74.125.224.49
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-660ea43107fso3062089d50.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 03:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781518773; cv=none;
        d=google.com; s=arc-20240605;
        b=kvwOHDLrcdkbjsVr5/e/heoY+owvh6i6NyYAn3TkmAB+IItYmN43DBeaqWxXb1z2rr
         PsnLaJzQ9Y/I2UMsdX6Yz7W8Rujp5p7VwjgAbQLdFhlbggQJnRxszieauTBdzZfmmONN
         wIgKHXeI/QTvznZWlyUNODKjXo2anVrdFsiB+WLXqUTUrwRJxuDoxOX5Dv1jHWz4S7H2
         rKuwezDraTmbQj1lmWb0OFhmNQIIGUXprXqlbdF/wI2bDz0xomrMEccH2DjbncX/pj52
         bj8W3UbLtuKTSLf3uXP7kKiYXdZ0hTTN6MnzeFio3v19LBV8SD+xYrqXMln+DlrCrjzn
         0RAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2d6EV/iVbdH06m+t9/NqN6KnbaQ59FzktQ3dFfEKRzU=;
        fh=5zBWXhv7It/QtDmKxkuxbeCJ6FWEl1MLITHke+B4Bks=;
        b=F2d5vqjVGQJRp6827jWnJduDiOoUcQtiZULBXLx/WLAlubKFwbQ0z4rLsbXs4kXhbY
         LFmAqJJz/3ZtmmnTtJgQjf9OJ3VUDzqamUIDdeuEhVTrz5ihZTLeR88XYo9tIMB7eJml
         hQThSw0axz8m8qnPRRAA8Ir42iuri7CKab6IsJ4w5MjxcPWLrKVOrTwus8xmmI2dvjBm
         YT6Z0t731GCBMdklHy3pVH9JfdQTxuksO6ASmc87yfr1dVBavw67rhtbvxhlfOWcuX20
         01OTdJQPQzEEIUJ4H0n+tKL4BCf19naocGBT/VOJjIUsWYt/SeecjVAof63S25VPBKgw
         McFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781518773; x=1782123573; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2d6EV/iVbdH06m+t9/NqN6KnbaQ59FzktQ3dFfEKRzU=;
        b=DTg0wa+2qJme1wNsVnqEWqC5NX91IFUomed1kSynlXr4m/nFO+fNH4ejMZf8xvY+rR
         JwzK0IgkfAXbNr46LmoZtaxMyY5+LZRMPRULSQlbFc6VdY8nPMysnkxZ3n6KGwWCSIVX
         lzNuuvti3Z1U19fyKUXQjA3nSaWt1tk8T1Ja+iVPsTY8gY51Z0Fh1S8srGopXw1b215x
         dXhOjYgBr24z9O/KPMjY2NcX97mZZ6eMrqKAnguXnWYRt73zBaBlkHhzsHgFvpSOlIK3
         hWH3UCbrngJHz3CQWYh1aDHIJYck+/xMUyeZetGgZ09yjt09FEtILWZ4UJ2GbAPOqYh/
         0wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518773; x=1782123573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d6EV/iVbdH06m+t9/NqN6KnbaQ59FzktQ3dFfEKRzU=;
        b=N8y9OE4oL3bIkwGIBrEG2n85nEUYLVwSxN60v1EOcm4HIV7FVNoKlIcBbLatie4BJO
         qBSkXZ581KEYhBGgfipX8LbowyeGCL5Hz0p+5lTmfhDXGQZGIdZZGEBFWdDFFIteBLXM
         f/7uCPh3MzYuBSO1W4HNmXqA446B0KRTuxUaDeDl12ZewJU3tZ/gGC66o3HWUMF+aflt
         vVH9YwNBE2Of9p1oQGTLq7+DuOkZHolH8q9p7hrHkHiz5uDsEyRSMmVSCmM5f2Re5aLH
         kGPKpEr1LyD/nNVT4bRIjqzMB8JKqRWLgnsbL9F9KEVsLiaEjKoE/VhOOftjCC6K/i3c
         HrSw==
X-Gm-Message-State: AOJu0Yz0AOZTbWffGhsTz0jdsDJ22e+f56Dzinfvw/wz0YmX70KnyIAw
	UQxcxxN+Aw3lLIF3jIRoqe8B3OcUaRb+OhQ/Vcg7x+s8AHcSqralh1+PVz0nMBsQOXbKSJLPdZ6
	dtxfIRBdzZLvoKMDo2np7mALtJZ/NGvJ3RR57XHC8QQ==
X-Gm-Gg: Acq92OEfE+YcXn0p0MGtNLxybirJGzuaKdumQCPjzwt8wqEbfJ+Hlv5YTMhCx8gh+0J
	qwg/MZ7aALbXJOiy0kY+prW/3Xi4YZDeOg/YrxzaVqVJfqCkGc6mdVpTcp1BMH7joQwUEelz7tl
	67yhP8HpjOdFmlTdbOYdvYBzFWKL4NqGR/uzWQW1GskclUoS9my0nwDjGMRz5xCQtTMIX4FzutU
	re6+qivUP5Xwd8F143pXi/7FgR8Aw8osYQf7om8VlQB+0dMerRodMwb2XTE9OjbMIg/HV5EQYVv
	2NlF8+llT7MA4CKTmJGZg0mn7kcWlgSb2bzG5ve4mN/kNvf2MJq74Qj+z91z5KCoZgvZvNIXaxw
	Sjh1erOMf/I3RsT2ZPIm1ysIe
X-Received: by 2002:a05:690e:c47:b0:660:4538:232f with SMTP id
 956f58d0204a3-662783aa254mr13745133d50.62.1781518772753; Mon, 15 Jun 2026
 03:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605074944.666654-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260605074944.666654-1-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 15 Jun 2026 11:19:16 +0100
X-Gm-Features: AVVi8Cftq6ajCcdbL3MMw9RgGJHb8u04VBtntzAGnwe90W4udPRxBnryN7Y-_QM
Message-ID: <CAPY8ntAg8O_D9CG66u3Nw1F=3UiagdMGMapJo94mHok9ymbcpw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Camera sensor and Intel IPU driver changes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lixu Zhang <lixu.zhang@intel.com>, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Bingbu Cao <bingbu.cao@amd.com>, 
	David Heidelberg <david@ixit.cz>, Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64900-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:yong.zhi@intel.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:lixu.zhang@intel.com,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:bingbu.cao@amd.com,m:david@ixit.cz,m:mailingradian@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,kernel.org,linuxfoundation.org,lists.linux.dev,amd.com,ixit.cz,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DF4C6854F8

On Fri, 5 Jun 2026 at 08:49, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> Tian Shu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> media drivers (7 and 9 respectively). Bingbu's e-mail address has changed
> and Tian Shu's is bouncing.
>
> Update Bingbu's e-mail address, remove Bingbu as a maintainer from Intel
> specific drivers and and remove Tian Shu as maintainer. Also add Dave
> Stevenson as a maintainer and David Heidelberg as a reviewer for the
> imx355 driver.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Yong Zhi <yong.zhi@intel.com>
> Cc: Dan Scally <dan.scally@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Lixu Zhang <lixu.zhang@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  MAINTAINERS | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e5..64478875cd78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3882,8 +3882,8 @@ F:        Documentation/devicetree/bindings/leds/ams,as3668.yaml
>  F:     drivers/leds/leds-as3668.c
>
>  ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
>  F:     Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
> @@ -13042,9 +13042,7 @@ F:      drivers/iommu/intel/
>  INTEL IPU3 CSI-2 CIO2 DRIVER
>  M:     Yong Zhi <yong.zhi@intel.com>
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -M:     Bingbu Cao <bingbu.cao@intel.com>
>  M:     Dan Scally <dan.scally@ideasonboard.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13053,8 +13051,6 @@ F:      drivers/media/pci/intel/ipu3/
>
>  INTEL IPU3 CSI-2 IMGU DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/admin-guide/media/ipu3.rst
> @@ -13064,8 +13060,6 @@ F:      drivers/staging/media/ipu3/
>
>  INTEL IPU6 INPUT SYSTEM DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13074,7 +13068,6 @@ F:      drivers/media/pci/intel/ipu6/
>
>  INTEL IPU7 INPUT SYSTEM DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13376,7 +13369,6 @@ F:      drivers/net/wireless/intel/iwlwifi/
>
>  INTEL VISION SENSING CONTROLLER DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  R:     Lixu Zhang <lixu.zhang@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
> @@ -19657,7 +19649,8 @@ F:      Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
>  F:     drivers/media/i2c/os05b10.c
>
>  OMNIVISION OV01A10 SENSOR DRIVER
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Bingbu Cao <bingbu.cao@amd.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -19750,9 +19743,8 @@ F:      Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
>  F:     drivers/media/i2c/ov2735.c
>
>  OMNIVISION OV2740 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> -R:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:     Bingbu Cao <bingbu.cao@amd.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -19894,9 +19886,9 @@ F:      Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
>  F:     drivers/media/i2c/ov9650.c
>
>  OMNIVISION OV9734 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  L:     linux-media@vger.kernel.org
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:     Bingbu Cao <bingbu.cao@amd.com>
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
>  F:     drivers/media/i2c/ov9734.c
> @@ -24912,7 +24904,8 @@ F:      Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
>  F:     drivers/media/i2c/imx296.c
>
>  SONY IMX319 SENSOR DRIVER
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Bingbu Cao <bingbu.cao@amd.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -24934,7 +24927,9 @@ F:      Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
>  F:     drivers/media/i2c/imx335.c
>
>  SONY IMX355 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
> +R:     David Heidelberg <david@ixit.cz>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> --
> 2.47.3
>

