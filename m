Return-Path: <linux-media+bounces-65154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oN0xF6GfM2qIEQYAu9opvQ
	(envelope-from <linux-media+bounces-65154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:34:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA669E1BA
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:34:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pcu0jB8Y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65154-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65154-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8341F304CF56
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 07:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE662E03E4;
	Thu, 18 Jun 2026 07:34:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A311B3C342F
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 07:34:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768092; cv=pass; b=jkCgj4vZs8hqXJSR9RUsyG5tJSfE1d0wzwkobRM5UYONJUAgBGC6vi72gq8eMU09JoGIaCgDCTTvgE5mEKU+ERMA8GiX5VoARHCSS0Vt77oGtV9OtTy7Mw5L/jG1iCApOJo777QQ7QmxiDLtO47Phx/ybgYEaOUcBWyOd50iHfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768092; c=relaxed/simple;
	bh=XEBP3OoNR5+PyWZ0uHQxnBx61yH38eXAeE9j5UsEFJI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ihQ18PympBb55ppubmImOcgk0alV+1wlOFW/Bb6vjzsDT1j6PM7fBnZ3EpU80EKfTKTo581f7IVbwOBYxEjhScyJyRzK1rwdVAFAw6Yhd58gOheeoz7xxk1a3kpryYuccmvKxvpfmWzEUIyyV5EdPINkMeYPHfIny7PxZPO7Qsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcu0jB8Y; arc=pass smtp.client-ip=209.85.160.47
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43bf3ed9619so103690fac.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 00:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781768078; cv=none;
        d=google.com; s=arc-20240605;
        b=HeXU4iB4QqlD+RW0DB9Pv3bdMlX3JVJ4nQ31zcOcyJnb9EGmqvKYVzLPV1EOYSXLG/
         V8mvVvO2PMmR7yoQDVKDS8umfUKdFxXbf8VhdF7SGbF6qVsGW3BcRXbXNNyPaOKJg0dq
         eU9u+yBkYj771nAf5gXRojra1jNkUXtfOYt0u04EbPR1tIE2XiuPtulRYPqO7RxZQagL
         Z9tyJDAZWfYbY/qCpx39r5bIyr0d/HgODOJG8KGTKLlO6XmztGSmDfywYtRWZH8PIW5Z
         LcwMQgoRgabIxHMPCuShB1AExoXY3zIcMMhc/zsDfAjJAxrVdY2RQXEoMGtrJrmO+tCG
         LG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=03087JsXjdPfjI1ui5edIRVUUt+2wCONBlvg8E9DqzQ=;
        fh=VuR9UiPqqGNpZB4bsom67HjSaOAzeLkOZ4CjA65siGE=;
        b=POV4ofMm+cuNfmr2vRxe/j8KDIxuQrgsI3NfUbc0VzUmvKwKUKo33AWIxwKpC+ZrSX
         nV3miFVdsaLWq7HrEbWvB1LdqMWXzOzRNtJD4J289Zv/mxb/ByjrqucGQSMgNcnlxyji
         +HI3OtDFEIRVFqoDUttoJyMFMf5HhfdSmS12dmcJvNAsqAD3nOJpLtSRV9xyCwrRflaK
         MNqM1j5DX6FUJX7kv3WEYimRHh+70DDQOdMBUfgH8y4k1TOlW49j/R3SYJ2/Mf5ieIRO
         y420L4gZRaQ9Gpm3DvQ55XpekI7CpoMspwX1TwWYf8aagubFIHOTXcrAmZzJ6oOgYv6E
         Ka2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781768078; x=1782372878; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=03087JsXjdPfjI1ui5edIRVUUt+2wCONBlvg8E9DqzQ=;
        b=pcu0jB8YcjAAFRxTru4yaK5emsrXhQTr2EIfS6sTwCAj5MxKL6odDcLpUsZH64F+rf
         UeXpelU696XUEjSdWslc32LV9qo88JonsIvKrU+7aF2ZtWpnHx4yb39kmw4ve9ZwNfIv
         ucnRzOE0HQf/9cOlHeoh6c/8xM8tLNClq31j47HfQHSB7DAQ3mMPttxF72hNpW44N9RL
         wsIh0WmLK5rFthL14rBb/mPvLuOYaiNx58gFZ2WYjLPXuizJWikUzXgAYUPoNYYR2gpW
         b17qcj+IveFg18JaLHuQeV75H5CDIrqel15H5jRXyphxYr0htyPj4GihVIKkKubx2o7p
         aMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768078; x=1782372878;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03087JsXjdPfjI1ui5edIRVUUt+2wCONBlvg8E9DqzQ=;
        b=NeigMPkK5VtCjowJrrqtHhS4X+iFwVcXby3UCsdlWBIlPb1aubyQJpYSyz2qS0LkW2
         21sgw8cHVh+mIhmjCNq66H4+C2qkQ7pus5xUFPYJTESQkoesr2s8EStEwBkPx+OvmYqC
         rcR/HNFvWdyz6lXWjDFd++7gAHX7U0wmfGn89gfGG9X+gvhSLVIfdQS2Hk1JzbCgqz8v
         jiz7CNNho3aXAl+24loJijFdAqipESlwWxwEb2GccxpONCwxkm/WI1KBqg2LwMp7hF4c
         VKAW+YwgK3GQg04/H/3tSxY3m0uMhgRKfz54awulDbugIcaGGZpwoowdsI3sirmB3Muy
         eWwg==
X-Gm-Message-State: AOJu0Yzsb6PeXEEQQj4IxGADnuPUZxtpbKtVE36pKV9VdahL1h+hj9hV
	EUXXqLlskymSDZnyu+gc4T1brO/Wp22U9XzGmqg42TMRODihWaPxnb+GyWnZRxLjRXJaHeDnvIY
	sArjCeUXGtBE0FlRMNG1q4Vm6DBAnMG/yi5ZURts=
X-Gm-Gg: AfdE7clZTt24nMiEFIOEsl/XZ9YY672cuRbyJPgA/mox8mxVx4gxHPMrLZwiludhJ0K
	/CsHLGRB9O9bvf8m1bq5FYdOuxwV/UmGuirxzGM1Drub6K0yFlyjzFDlsb3xCPNxE2/CLjC4OjB
	JMskjPXVRbzfEtvi0FbmA/ClgGl6P+d8ttifA4Ge+BXhvS6WHjILK6HGMiRDntRAk3K4VmaJEUa
	FAgrx3sCDY0bekkDXbYxi6GyH3c6+CD23aYqCmOSInzmUrW9bmQdBQLMmZGyHr+F5GpXcsLo8+3
	7jH52TJbvSmGQuYZJ9/blRdJ5ZvryGA=
X-Received: by 2002:a05:6808:4f09:b0:486:7a1b:5a9a with SMTP id
 5614622812f47-4894441e545mr3149153b6e.2.1781768078226; Thu, 18 Jun 2026
 00:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: evily <kalennar@gmail.com>
Date: Thu, 18 Jun 2026 10:34:10 +0300
X-Gm-Features: AVVi8Cdek_wfa4OH3KDIwQ5rljw1Mbl1TYxd916ndUP9dtdrVoshSndkWy1NEak
Message-ID: <CA+7Ldxk-VoXp_fch3Du3z97YgMp+7dUu0DpnS7JQKUB=Qboqhw@mail.gmail.com>
Subject: Testing ISP Radxa5B
To: linux-media@vger.kernel.org
Cc: paul.elder@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65154-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:paul.elder@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kalennar@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kalennar@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2CA669E1BA

Hello everybody!


My main purpose
---------------

I saw the news [1]. I have friends who are interested in image
calibration via ISP. I don't understand anything about image
calibration. I want to make a test bench for them.


What hardware do I have
-----------------------

* Radxa Rock 5B;
* Radxa imx415 4k sensor;
* Radxa imx219 sensor;
* Radxa imx214 sensor.


My current stage
----------------

I checked Rock 5B, imx415 and imx219 with RadxaOS to be sure that them
work. They work.

I built the system via buildroot with this kernel [2] (532f326bf4). I
checked schematic Rock 5B [3] and Rock 5B+ [4], `cam` from 5B has almost
the same scheamtic that `cam0` has. So I add to Device Tree nodes from
rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso. But I got an error:

    platform fdd30000.csi: deferred probe pending: dw-mipi-csi2rx:
        \ failed to get MIPI CSI-2 PHY

I solved the problem. There's must be set in defconfig:

    CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY

(see rk3588-base.dtsi csi_dphy0 node).

Now I do first 2 media-ctl cmds [5]. And trying get image via v4l2-ctl:

    W=3864; H=2192; P=GB10; D=/dev/video2; \
    v4l2-ctl -d $D -v width=$W,height=$H,pixelformat=$P \
    --stream-mmap --stream-to=- --stream-count=1

And got something weird: many '1', '2', '3', '4' to stdout and
stream-count=1 doesn't stop it.

Maybe I do it wrong way. I'll be very glad of any kind of help!


Webography
----------

[1] https://www.ideasonboard.com/news/announcing-rockchip-rk3588-isp-support/
[2] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.0/rk3588/rkisp2/upstream
[3] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v13_sch.pdf
[4] https://dl.radxa.com/rock5/5b+/docs/hw/radxa_rock5bp_v1.2_schematic.pdf
[5] https://lore.kernel.org/all/20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com/


===

Best regards,
evily

