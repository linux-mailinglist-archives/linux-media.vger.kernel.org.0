Return-Path: <linux-media+bounces-56999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCTwDorLw2lKuAQAu9opvQ
	(envelope-from <linux-media+bounces-56999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:48:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D67324316
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE786300B3E0
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688C13CAE79;
	Wed, 25 Mar 2026 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OOBF4T/8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD4A3CF048
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438588; cv=pass; b=nwoIk8fpwF8T2L4MUIV+n6ODWaWeJuljLsNtQzAb6DbbifWq1pQfNaRSRshTpbdQUM10rI6fTPuhmebuOKCZ/LJqGPwBo1iAAuWZdUNVtRjP+YrjJqscsrKpo46YOiEciA9erVCMwKTHRwAdak9kma6KkwdZJUAkqGSIWiuOokA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438588; c=relaxed/simple;
	bh=jYJ6VW6cqloRi2yxY2TmIyUbCQp72oo8EzkOARRZiMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXVBCSFrL02C2QFiZjRzUWbPvtj6paGzZmA/ZBlXR6+iD09/MHnGrxQSt1dOKHxJoCX34kHKXSfOZh8enTD8SmziZvRGrEKokMgGj7B0sjecqxCX2AI1NXSz77DOP/4Rp1uPrmz3GHxqTKGtDW1+cpZZrfx+CkKmrNm4/y1NU1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OOBF4T/8; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7982c3b7da9so22789617b3.1
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 04:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774438586; cv=none;
        d=google.com; s=arc-20240605;
        b=PORwaBwChRYGqDaPPUulWTNsCyA3R9azOGlCL9yaEZDMHX/wEEkrQF1XbvitQGethI
         qOAkFe4Kk4GG1swbHcfX+qgvceSQT3v0gj1PHFcHURFMQHP90nOflLwIoBTkzXMArIrc
         8nedWu9PfftJFRd8r9p2kpnMy6bUBl6XLwnhX/Ds1YIjl0AxDOLbEnSH20dX1JstHAnS
         SkOx1gq9B2DGVT73N5VVBxSDEp7hMG4Qngw3gEHaQTvs0/yhZL5NTuujQHlRDc0FtG7U
         L+1Fq+wWDyrPeHTsd27WgP3eA3EpcQemlDs9t7yCe4xM6Wmg9IKYUd+9g3H2GUniEFCT
         6r4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IBlF4KOxbpKPe6Mg6fSVT0yKogrzCqPzXiPVSkS0bEI=;
        fh=5fvgRv0JFQ+qxRjMG7lVpR2l1RbaMPElunm4U+F9zxc=;
        b=VbbPFPQMOPLN+PpB0p8m6nGtV4N6UI/SRKUznsM4ypIJlKWY5oSClFe5CDsGGXIatv
         Y4qTTAQF7+ItmarwGklOsjcphxL0uBucC4cxWUX+8P80JbQ80ZzVj866hDAkH2u8OLti
         n1kvkAc6764sqYSPCuqlX7cL12rGmfKZuD7vYjx/FfL9/ILcRCPlTl37qQjX50XrLSmC
         VJSWTzAUWIgExoL9R4lTIZ3i0VeqVcp70FTPh25Sc/SgTWtIDcFAWcmhE0Cef0DAZ3g2
         YXVlMAE9a1Kz6p8eLCrf06kshShBUWNfWpuLaYCAvOC+P3FOE27+dSo4pkNtqnkp6+fm
         DJsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774438586; x=1775043386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IBlF4KOxbpKPe6Mg6fSVT0yKogrzCqPzXiPVSkS0bEI=;
        b=OOBF4T/8ndlCAr4s51S6F9LCjYV9kapkOg7MNFJ/WSWjrLMmkaVutMXUYZZsp+TA+s
         mPCgsbTObwacz4OZkk2wgrLI9yNSIY7zS/HosaOih88IBK0BFBruz8wJyDoINKS/zVAq
         3Tnm1NIfs8vMinHcZxPU6JUIIzqa/kjn4/AHCInt/xRRAHB6yAwHTmp3B2VtACFfo5uP
         ctQun+vwMWywzc2rHwaTSZ2AuFzp840fZbybou0zZqGWiCt9pwOjiYd73hpXwRkZ8n5Q
         dYePJ4GJGEMIl58T9alDK7q839TZEiDh2FOL/C9h6hn9BJxnFTJvkxCJMi6FCAhFioT9
         r2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438586; x=1775043386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBlF4KOxbpKPe6Mg6fSVT0yKogrzCqPzXiPVSkS0bEI=;
        b=BJtXF3uHsLhDl+k6G1JMp9cc2QrGW3iZk4Il//9G72KuHiGbszakJUFBJi2tRSJ41y
         M3vlndtb93CdoEZCLGEdTRzxO7LN7HTvwhmJHMXi0BuCOQnh3OpKUMJ5Goehk6oSmjIZ
         s1SE3lYk5nw+bENf0AwXJiyyFVr+W2pYqzKx/GhzZWoOr/L8HasdX0dMem4PMh8ro/0t
         ieehY5NImjwGSNtqV0apL6sg+ipOGUoIfExOBVIInnmKg4BYyL9NRvoJYmCnzeOANRO5
         4IUlWvSID4YV0g28AaHtdL73FiAEWdxH/VbKmoq4HhSZltGhVRrHJk/rdendjQhpAmyV
         byLA==
X-Gm-Message-State: AOJu0Yx+wNGgwHywNT2xN+N4ZgzJ+60pQHkcgXiH8Hf/XO8RJAub3hb8
	AFx5qig0GphUKttlNerHDpO/3Zf8VKHV1n25kS5dCOuEM7NQM6gkKBZCd05PXujIApiHTgpjDgk
	yFK0yF8w5DJIV39QcfzJaY5FiNYgrcTEgHJfg2kdReQ==
X-Gm-Gg: ATEYQzyk7dQb2eT+mnhHek8/QoLMpCXyg6K6W0dGo1jhfWXtr3Jnys+a8A7zH32HgP4
	bIJmCPO+5GxltoqREza4s3j2MBjA0AAZr+tjCJ9G74S3BRVAf1Kr2JQJecjrHUXegnsvG1MEGHS
	kdDwLqdwO7xu3h779cV2o60nok1V1ivH2SAcjt19Dfxba1goJD4jj3dPOK7+/oywm8jx2QtscFd
	RaFvJCCRrZDNA0nh38zCmvIHzRPTWbr+KhBC7U1Pak1t93q+XZOGD/6z/U4HAA9TfuWfjVNa0/x
	gcgLJK42uu++ECgobCuu5D8+mWQop9JUm6myag==
X-Received: by 2002:a05:690c:c4cb:b0:794:ecaf:c501 with SMTP id
 00721157ae682-79acf6c89c9mr30923677b3.46.1774438585605; Wed, 25 Mar 2026
 04:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com> <20260325105818.1176816-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20260325105818.1176816-3-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 25 Mar 2026 11:36:09 +0000
X-Gm-Features: AQROBzAXOp3kglL4hAfuouozUMb9MZaofXq9rB9_TdcbnAUlcF_lf3J9Rc3pQqU
Message-ID: <CAPY8ntAowXdWcHe1fnDfonx8VMB7dfGf3xLX_B6uBoyGUaN9wA@mail.gmail.com>
Subject: Re: [PATCH v3 02/22] media: imx219: Fix maximum frame length in lines
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56999-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,raspberrypi.com:dkim,raspberrypi.com:email,intel.com:email]
X-Rspamd-Queue-Id: 88D67324316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, 25 Mar 2026 at 10:58, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The driver used the maximum frame length in lines value of 0xffff, but the
> maximum appears to be 0xfffe instead. Fix it.

Agreed that the datasheet says the max_frame_length_lines register
0x1142/0x1143 defaults to 0xfffe (and is read-only).
I haven't checked whether using 0xffff actually works or not, but it
makes no real difference.

> Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cbd151d4af5f..89061dc1842d 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -72,7 +72,7 @@
>
>  /* V_TIMING internal */
>  #define IMX219_REG_FRM_LENGTH_A                CCI_REG16(0x0160)
> -#define IMX219_FLL_MAX                 0xffff
> +#define IMX219_FLL_MAX                 0xfffe
>  #define IMX219_VBLANK_MIN              32
>  #define IMX219_REG_LINE_LENGTH_A       CCI_REG16(0x0162)
>  #define IMX219_LLP_MIN                 0x0d78
> --
> 2.47.3
>

