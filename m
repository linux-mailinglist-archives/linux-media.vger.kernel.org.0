Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E91746D8C7
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 17:45:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237218AbhLHQtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 11:49:20 -0500
Received: from mout.gmx.net ([212.227.17.20]:33407 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233943AbhLHQtT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Dec 2021 11:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1638981943;
        bh=HDSvsSX0y0q81bjMvMiF10BoZq9cH2gPg+4Ln5ij3mM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AIXdYvwBl1HhGl1XPXWO6eJSBnK6C8difaY+qPPCXfnQMvuj4kalHS3HudPBNEvC5
         v4ORNFYVLlGMxeZ3dntIvbnOctrz8fhXg+kJwEinGOt4ILnE2+xXu8ZahfPNyk+13T
         kNKzoAHVfX0qRADWhdJxjL/FEhOgw0ZXEiaAX190=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bs36.server.lan [172.19.170.88]) (via HTTP); Wed, 8 Dec 2021
 17:45:43 +0100
MIME-Version: 1.0
Message-ID: <trinity-904b019d-ee32-4227-9160-001a00fdd69f-1638981943562@3c-app-gmx-bs36>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: si2157: Add optional firmware download
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 8 Dec 2021 17:45:43 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <68cd904138504a94c5e592b50547e0a22cd33d4d.1638958050.git.mchehab+huawei@kernel.org>
References: <cover.1638958050.git.mchehab+huawei@kernel.org>
 <68cd904138504a94c5e592b50547e0a22cd33d4d.1638958050.git.mchehab+huawei@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:3Pm6YAo8uB1QpDTueTaf194AL5f6cnab2Hrh3yd5bgZX3DR3n6jPOBLrFiMbhHIkbK74x
 1pv7NWYGb9GcEWV7l2046kaHAybzi1aZ3kaw3d5IWATeb7VGo3WRYaG54bVKSPe9U1IWqp2MFVlH
 t354kqG4d5hztzMT7exzJEVTwpnNj214GbfiopwPRnVm+wi62PLh1mddiPWDELp3FBnACqd8F6UU
 bFiZdMQLzUFCdnS2TvFGdOTAyMp12KrR9TxdgWIqx+pgcsj2o0Rm2gA2RbCXBXe5/2Vobi7VCx00
 Ew=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W28P8p5sC/0=:P03f64mH0BFgMm446Z/0iW
 NBryR3aHlaJXtDg3ciJcij6x9n+JLEoxsy2xCH5C5GKyXsPZGxfnBb6JA/VDsPpX8/e1KT7bY
 0Cc2dtrwCUFknJPaqtsqjIUPo1P/76P0vn0wp7QeJ7czMrRUrCcsSF6gqZS7gUsC/6iuAI2+S
 RPEgx5u8DV+AhSGAM7TnTEXmkFKqE1PPnzwTCM2SFHuq531OPR0/rI0OftBR+4QahEV7ek+5C
 9spdaRpOZc1mBSRtKG5vdyasvoEGxzrkkZZx9gMFmZdbPmvH2+e9IvMBhAK5OH1tdCpSczNgj
 48g4DZC1OjIXWrFVzaGX2RALcfUA7cFus94EMsj/Roj8eyX4xAk5qkdEEhfUrOINWb2kuHFtn
 /wu7prnPhvZIt38S93TVHluYC0GNmDAhXRyPLnpUhF7p15Sv2cdZfkuACAbdRuDt2PjLzGyj6
 kTIZOcZ/iCemWigoe7+vjEFb0e8mpdijYIQ9CNN4uE8Lqj+DmiyO8tg0NkxHpGiOZMev+wjyo
 DbnlAeWMLzAPj0Gb+iAOZvwJgL6588XYfjeDpreCJmZYnZgwnLJiSNiNuercmFT5uxcATeVMl
 QfeBS4F+/phZjrYW5OegYdL6S1GCEspH1AOO35R+or0fwifhia+s8s2hhwepZWUcXPOi032Vr
 FZkKPsYyXZIpCm24csr+FcZOu9fvFU69Ni22MsaOM8Ztrwle9S5iMSTAcRvX2eeL0+V/a7xd9
 86yFcjmB2Up0iOU2vAmCtBAemoaMK8GerzToA0gjbCoNJQJgpVpgGswCUPFOkYHSgOHymSJ9u
 +mv9f6o
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> 	ret = si2157_load_firmware(fe, fw_name);
>  	if (ret) {
> +		if (!fw_required)
> +			goto skip_fw_download;
> +

In conjunction with my proposal for PATCH 1/3, this can be simplified to:

ret = si2157_load_firmware(fe, fw_name);
if (ret && fw_required)
        goto err;

Best Regards,
-Robert Schlabbach
