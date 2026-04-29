Return-Path: <linux-media+bounces-59910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG+YKumb8WlfiwEAu9opvQ
	(envelope-from <linux-media+bounces-59910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:49:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421B48F894
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C7C0303351F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 05:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F12A3385B9;
	Wed, 29 Apr 2026 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlLIBNXG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246E27281E
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441762; cv=pass; b=kmDJqArOJwGs5m8bnPr2gD827uUO85mmc6dK5xNCQA5FHGGbyXFdFDVHtEed12Ga9cP4j+L8xkEGIoUZTuSoDQzKep89j913jcS5aFmdnKnArarO7A7B95lseV794VRVeURCnF7kzSHT8D7sXG+QQh1KChnx3T72/7H9nY4oWSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441762; c=relaxed/simple;
	bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PedLn7K7KPQ6+rg/zzTywFc8O6sPJpBDwTVW3uUiWl5W4MrmXvy4NmDbUwYHQMr/0rvQ4jPF2AS2xNd1qqulOS6V+eQNDKqiTkv8FSNFb0Vio1P+su6zimKLcIg5rlXHVgxCsiTIQiAGNFBRtDyZa3JsxHQ7/E4BJH1LFRFOPJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlLIBNXG; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ba699316b42so1543834866b.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 22:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777441759; cv=none;
        d=google.com; s=arc-20240605;
        b=HFC63L4smc+UgOmsPEwSkPeGUZKPXrFJzyN3kZ3xanNMqCvGn7jiyqd/54pyhSu8Ff
         d+Dy8jBw/xxbNUO1YsmzWceyyM7/M4IGavJELha0T5ZclFLjDGGuvRw73l14AXQwKuyK
         GOq6f9B73LXPiDuYBLcbU9mpAZb/n8VHt99S/Gwzgxx1ykpLpPj2a52j+yfYk1lJC3Qp
         3/yua0qxNhBNKm8ZzlK7f1XTGJNCkeN+Hb8sBXDsFkeFUytO1m/xirfve1/VE5s51Vjo
         y5GQqfs5+yBLaqP1OxB0TIu3pvZjpRQOPzKxV1hE3uqsEZTbxKyNg+CZd6h8hHY2zA4G
         L4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
        fh=FoGomdC/m0jfD5hvw+iPZb9VrUuQLNlXFcPdxCN3QLU=;
        b=CFcJjug0AEd8xtoyQIbbqNDQTPg09FYpIhPQkMRqJuitSo8teTndlaWZL/yTZJxx84
         CALtRZFYajUduCHM7AAFjlS6w9HNl93rIpzLNOPx4DO136ZIzpD9UHlYP5xFO0xsfOQO
         yWFXcdegRoU81/R/7y2OC10O8yqXm/W+f+2rnk0r4zIv6zsqCXw1QfIFXpGNsWFrRJRk
         1erJjFXyNmMxTlFcpfWhBkAN5KIMF2GdG/n8j9h8gSE8lK/BsZ2qh4wawy/5AmMjmCXI
         SsBPjh87wbpAF9Rj/q9d+f5Uk6x2vnXIwmpOJ912gr5fBUyAxJvuVjc+AGggMQ4/ad1B
         3bow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441759; x=1778046559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
        b=AlLIBNXGqNnuZlYL+p+bXH2B541jdet7Ic0zZoUCQ51ExDrxPFfJdMC61DGjYPMSyY
         PDQO3AmmNuPcF0fc9nSCg2UtXhUlquP2w1mseYjJV/hcemB1fv5SsXg/NjJS97Tk/oeu
         Tsyn07AFZyjEbhgL82VBaeNJUlooPTq9TI9xcXG3nOvIoVIZt06H5bA657bhR/vl+nQ6
         ngm6fSzxQdk0BSxdxSV/7bRN4CKDiBXjiPihaAdmMepxwLQcj90jHToSewRF1cntdzcN
         gU0p9yl0ssfl3suuNbRxVVjCzBt2s0DzEwYghN3+luu0/JJGwMpG2odbhSMHwimNDBvl
         c1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441759; x=1778046559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NwRV2kYrYdb7V4qwDjoqIgMCdFIe/qodIEPhLrCQ0dE=;
        b=sAVOrHim+Zdo1XrTGidHLKG0yW591579gl+J7Bv2WEx8brlO892OAhz11io/+RbExx
         Z4ZkPn0oIKgqE3M4Kzf9SIsiVPa/cMkq50o2FPzQFYCW0xmpPMxb4cxDUg+2suFeIs1X
         2qq68Gya//0+BSSjnM7PjmTkS9RalCymNOms28+z3WJJezta+F9I3/fjojm0LipqTTlx
         gqoE8eGpGg+Mxj89oINQCpehGmL88L6xoc4H7TlQcvm07oUh9jAJKmaAyt6BVl+30aPD
         /sCHHvxCSGYxennHDSUCVhPbVsh7Ex6P+l5mGQFbZUIVomM3fMB29YT8BlQRMwI1Glgk
         JgrA==
X-Forwarded-Encrypted: i=1; AFNElJ8c4OoOpzcmHaBzPeHwcv5PUWbAJ4gH1+sgooXKSTSswTVHI6/o3V7zUXZrLnGA7KcPEQzrrre/L1mvfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu9d0NU8D/udfS1fFlQrYlztWG4MkVfWMpfw3vdxB/OJ7E0GjI
	XM0vmp9rI5sEgZ6tT9v5HaDkq0mQp5Sa0+p+iVFQrVw83fXCTPtwVRqg2yKGDV8FJ2H/rW9Cv0T
	sH8QyY3tyN55ZEuhHqNFReqB55iluJ1OhoXv2
X-Gm-Gg: AeBDievXDRu80+rkFcHSoSgdDHx30tYytzkHgadQniskiGIEss6pqIDxp9RHFRPGqlw
	iDMAMP5iO+nFWDo4x2hYnsvae/CIramjlE/mEBm7gIglP8uMcBt+HWXw9XQ9+VX5mE9WE8mzwgJ
	ZUxbDEgEcl092Sf9pG0Te8+J0y6SnMQnuT5veSMuwGT/Gv5mmU0cPtmUFTwVMtR1cdZrYCydwtk
	pp+yJ6MdCuBBVTWZl4LTiA7qSITt1yXuaTpJF6bZ1ZOw+UmvtCd1IFXQSOdS+Caa45FI2sgPB11
	c+NkWGXWgy5VQ3p2UfoiQN1ct2KpT9x8Q5Gfnb5Q7457O0FGT9RfBgw0ah45+BvHek2Deiv3DBh
	o4Pd7yfjqbzcra/7Ei+zvRm6zDAkiug==
X-Received: by 2002:a17:906:8d8d:b0:b9c:b682:83bd with SMTP id
 a640c23a62f3a-bb93c5a04e7mr141132366b.4.1777441758853; Tue, 28 Apr 2026
 22:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429020335.83143-1-skunkolee@gmail.com>
In-Reply-To: <20260429020335.83143-1-skunkolee@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 Apr 2026 08:48:42 +0300
X-Gm-Features: AVHnY4JLhSADkEpO7gqOKY11kHU9CSlehpegdwa7RODHETaXl32kSTomXjSuQnY
Message-ID: <CAHp75Vcf2gOf_UK6x2=ZttqLE6ErGVO5tK3Cc5HszGfAVTUksw@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: ov2722: clean up ov2722_startup()
To: auth <skunkolee@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0421B48F894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-59910-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 5:04=E2=80=AFAM auth <skunkolee@gmail.com> wrote:
>
> Replace misleading comment with description of the function's purpose. Al=
so replace return ret with return 0 since ret is guaranteed to be zero at t=
hat point.

First of all, wrap the commit message to the ~72 characters per line.
Second, Why do you think the comment is misleading? It's a TODO item.
Perhaps the better change is to address that?

> Signed-off-by: auth <skunkolee@gmail.com>

Last but not least, use your real name.

--=20
With Best Regards,
Andy Shevchenko

