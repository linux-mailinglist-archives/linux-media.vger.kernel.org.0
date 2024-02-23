Return-Path: <linux-media+bounces-5773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 034998610FF
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83C6D1F23796
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31097A722;
	Fri, 23 Feb 2024 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="CxYx3wMF"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCFB76911
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708689968; cv=pass; b=A4pjy5lbxDiHQH4YL4VqZzQLpJtAH6py0R6LreMPOhVIoyrZzv8qij3KT/no4rH/D5GLXIN62jdWg4Mx47FOcQQogBOh390iR+zJV/hFS6xJko1utTNuhA8tmXI7t3+Fy6rRfnuyE2TWwvPzRbdHQ00JvX78Az3ahQ4USjco/W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708689968; c=relaxed/simple;
	bh=CowqNqxworXJGigu8kHltNN06zuqgTejztiUnItruZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmcuHbPxGp8250iYQ1Kj808dNlPDo5r5GJPn0pnOamHQ95vtoAWKcsRXPZevCpteRlDr1gdnlBJvA/DH/CQI3Qq8NAGHnh2skArhxVTXzqmPK3rOkEsq9aOzCc5/pX0qnwSmV+QhciROmS1FCydkYa0FWdw5CJH/af9QmGokRiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=CxYx3wMF; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Th7yL71Nlz49Psw;
	Fri, 23 Feb 2024 14:06:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1708689963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kmFmw2QOBWOXbjUd/9mr8vc2yK+WGLswbcLSuVg6sIQ=;
	b=CxYx3wMF9PoqR4SE+WuEbDkg9GFmLhMfCfV+w99ZetlNXtiuxNUxgc2qzg7WHYRsAVb4P1
	0CtQWwvKU+UIyKHEC8J32Fxp35xzioC4SNVuLRX8kucuZyEJ9CqlPFA9p1ppge7w4YXU9r
	FHffrXKc4OSU1DSmsZbIhg777dpPHMIu/RcEeUOJFrNhqfT9XTbM9/a1WsCKCBWcDR+3fH
	NfBq4ed6Hfa24BXw5SQHVe9yNvS5VKXVQM86f1GLQ6PV3ZTRtfMrSIWkl25QlgME0yA57z
	9ObmPfjSQHurgiSXj96UE0H3AdzoUZyNNqgLgKSplM0Aj2Esn8tlfCVfnw0aNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1708689963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kmFmw2QOBWOXbjUd/9mr8vc2yK+WGLswbcLSuVg6sIQ=;
	b=UtOUku+FwFEUdhg1AEdg6v//kk/pcTHEdWnb+boMp1cCJ8M9EA8XmitAGq/4/H3U/QiPPN
	8pOgRh1fPeK65JSZoJfIk7e5qQpTlL7ljbplr7TS7k86FW1xTa9Sj/Mfqhr8Bw9FdtDODE
	dlF2LXpgDZIU5MfONhI1dCtc42LGmoCHEsaqDoTuMl2td2gC3ruljCsHJo7kM6TcQZ2ijd
	cojbtt2i7t6WQSNY1cpz5KaCNt4CkqRelHV6QmtNDek7d5M8enAEyCQRRNMzJH0tdpTD8y
	VEYs04FmvIMKt/LJT1h0rIyR9beYuIVbmb3KrRomLfJoly7nM4sFt5W5KezEvA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1708689963; a=rsa-sha256;
	cv=none;
	b=EPzpQpvZ0Exe3cLQuOxeHq6N1YJzeR6CFvtkiYjNDgMMyW3r55O4pWi/2+O7XRuGBALgbo
	IVkT9k0qXpEY+hYeC1iZxFdp2wUiGUCwG4+PJ/Fa/ecUxGQICKbwxDs8J6iFy1wcJZgifA
	H1uNW9x/7LhpblTC8MwHHOwWcrxt7GT4gff+cGZT1obakK2AgrT5m1eF7+RsGdfp6EQAhr
	G8pv1hm5Ys7aNWnJpybFXY865e26iM96D4TFallMyeAigKeddkGLdbi10bQiJQI5krxjd2
	nUVSNy63LYvbswbkQnAtkVjStN90aPruflXfauY9IxIV4c5gMcJ1IhLiDukagA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E591F634C93;
	Fri, 23 Feb 2024 14:06:01 +0200 (EET)
Date: Fri, 23 Feb 2024 12:06:01 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [GIT PULL FOR 6.9] Revert a faulty ov08x40 patch and re-apply a
 good one
Message-ID: <ZdiKKaSidocvnIaP@valkosipuli.retiisi.eu>
References: <ZcIg6YsKuLph6KV7@valkosipuli.retiisi.eu>
 <20240206130838.GD13235@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206130838.GD13235@pendragon.ideasonboard.com>

On Tue, Feb 06, 2024 at 03:08:38PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 06, 2024 at 12:07:05PM +0000, Sakari Ailus wrote:
> > Hi Mauro, Hans,
> > 
> > This PR reverts a faulty ov08x40 patch and re-applies the same with the bad
> > DT binding and source changes removed.
> > 
> > Note that this HAS TO be merged before sending the current media stage tree
> > further to Linus.
> > 
> > Thanks to Laurent for spotting the bad changes.
> 
> I spotted it thanks to sheer luck. The interesting question is to to
> prevent this happening again.

Indeed. There's nothing in my workflow that I whink could have caused this.
I basically did b4 shazam (which was clean, I checked), then edited that
driver file only, followed by git commit --amend -a. And there it was.

link-frequencies never was an array of 32-bit integers anyway. I may have
written this some years ago for testing purposes but I no longer have such
patches as files in my work tree, including the git stash.

$ git diff 88a058cbd080..034b58342662
diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 26e3e7d7c67b..ea511f2fed98 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -190,7 +190,7 @@ properties:
       Allow MIPI CSI-2 non-continuous clock mode.
 
   link-frequencies:
-    $ref: /schemas/types.yaml#/definitions/uint64-array
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     description:
       Allowed data bus frequencies. For MIPI CSI-2, for instance, this is the
       actual frequency of the bus, not bits per clock per lane value. An array
diff --git a/arch/arm/boot/dts/ti/omap/omap3-n9.dts b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
index a3cf3f443785..728a8fcf25b3 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n9.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
@@ -26,7 +26,7 @@ smia_1: camera@10 {
 		flash-leds = <&as3645a_flash &as3645a_indicator>;
 		port {
 			smia_1_1: endpoint {
-				link-frequencies = /bits/ 64 <199200000 210000000 499200000>;
+				link-frequencies = /bits/ 32 <199200000 210000000 499200000>;
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
 				remote-endpoint = <&csi2a_ep>;
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index d28d31ddc2a7..5631e7d1f328 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1361,8 +1361,6 @@ static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
 		return -EIO;
 	}
 
-	dev_dbg(&client->dev, "I2C burst transfer succeeded\n");
-
 	return 0;
 }
 
-- 
Sakari Ailus

