Return-Path: <linux-media+bounces-65307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hc1QCTZgNmrr+wYAu9opvQ
	(envelope-from <linux-media+bounces-65307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 11:41:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E76A8B0A
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 11:41:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="EHW/SlmR";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65307-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65307-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E72FA302C6CE
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 09:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9391D346E47;
	Sat, 20 Jun 2026 09:40:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1017330641
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 09:40:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781948458; cv=none; b=lZJ67kkokwR4r31Vc5gEEuE+9hpPWyHjjVWZlQMgvNXSJukJQq4H/qk4wGLKKUwy4bycVvlSnOBAvas8hlYY+FqTe83UrEqtk8sRpwXatGaonKmeQ1tmmczW1YFsliDTjG+yBLzP/Xzi8GcRUoeY20rZT5H/C88FCpjs5YAutrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781948458; c=relaxed/simple;
	bh=bzMmMdDZb12pckhE1HCQMpbb9uubjGvbW/Q8Ly/dSdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC40sX0h2XIq75rzhJXB+KqULORxZi3gEq7K5UnCl3uENWrED2XiwRF2wHA4bpJicejCpYHqa6VDvej5QymcG/QYbhf9FFtVjqtymSekeFWGrxLGIPMOJSEq+r9hP8MvJMuAecJEQ+edKwV24kANMRJmobhgyLAm7/EJ8aUBe3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHW/SlmR; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so17062175e9.1
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781948455; x=1782553255; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgheUV57e1fbvrsFvTQvHjvUlEm1rXtz0JpJatjgsuU=;
        b=EHW/SlmR3z+gws3WiXee0kX3HBdBp/wZR9ICxlu6m0ZZZ9m9UDWLsfWREgvA+SeTJ7
         7kF0p8yPd8IG+nMy/U0nmbJF3vm87f1nawlyHozRiQ2e8mc1bba+67NLOEFXccYIan0k
         8DfyrX2GTZSPRey3VkysXWkCcQW6jMtVv2Rv8ztq+T1CBgP/pnI7FdFe+yTsu3Ts3Tzs
         YEdVcf+6wHRDtF3DvZ6oktMrgEM1MdMcX9brHSGEg9So7gompzpvdOFdlKKuU84rX8pA
         cgDeeWntGuMpninhvj6I+MpSJggiJDgvgGYfX0tNTYubqhRVpaJJ89q30LHVrTGl7VrQ
         UCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781948455; x=1782553255;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgheUV57e1fbvrsFvTQvHjvUlEm1rXtz0JpJatjgsuU=;
        b=YAaU6jDBmL0gJfjn1CcDtS4Wj83Mm0aRkBZSQ7GqzRElSnVfaOmfNh67a0SuDFdEVO
         jsLricBtGRbc1oUv3ZadRHDIYlt56QNbfof6qtmBpWFHRrk6QdY1+OlG+yS2Gpe4PtUQ
         z7hK7BL/jiiTqiDqAVgKd5tfwMom595x4L1ZI8TS7meQSfH0igczAof9qlQw4IWiUrFk
         bLAJkvz5pbCbALibf9mDI12S5TGdldNC4u3EUiMTNEX5+kJxdE5ZW0Ffs6g1Pu//nXXN
         hT8sCGgBxIGOp2Z+unH/VC0SAn7UAMSJsqOrguDwx/yFrF7Usy65hkiqDc7MU0ZpXlJo
         QXXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zPOH1sS+ggjWpYgW4+ywT0alvtqpGB0oMur174WwiaAI+R19BZhvF4sawVRB4BFNCNjoU2Y2wsxdu9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5l6g+/3pszoUuKOyQjeAgZDUi9E4OeOfVdggm3tL4h6yKwFl
	eACak7k5bGY+zWuxn95sy0jK0GuZVUA623kI9B8G3LHXSFLVD0f+mhJf
X-Gm-Gg: AfdE7clozK1DROQSKyWtijWTbi1yBU0w85cGTwG2jIA3IG0kLAzDcJdQqbTRnEzbT8R
	w0D3GEpu/nPHRg7nhDmYd8NvC1ofHQoO1Qj+Wqh29nbqQiM8B113i3DGuD4msDc2a5a5YxjokPu
	78wCW6j4BpzG2QzJDWawuohFycKdPnjrGoW2N/+u9wJ4QTPFgRiqJwTXIMKbOWaQaMYPjOkkGHs
	8qEEU/EqgEdt9Y2n4i6AWant29VPldlUfhPHeySK9bKwSEos+HHY9BZiUBvT1epUg3arqTiexJU
	agr5e+DxdtfImnfHW4B1rcTNc6NMtdisdhRBdKVJciregYwkgPblz1K63grZ3H00kxDoTmmEiFw
	RinzBoDRvgKd99NL1S4AqI7LNdB2H6xNkDGKKBh+xuCTQrI6JHp2L/3EkFaIFczX8fA910rNGHX
	niGEYgYZsw
X-Received: by 2002:a05:600c:3145:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-4923ef47e68mr134199885e9.7.1781948454982;
        Sat, 20 Jun 2026 02:40:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923392dsm84208825e9.2.2026.06.20.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 02:40:53 -0700 (PDT)
Date: Sat, 20 Jun 2026 12:40:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?Andr=E9?= Moreira <andrem.33333@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: av7110: replace msleep with
 usleep_range
Message-ID: <ajZgIl8e2e7dMaPh@stanley.mountain>
References: <20260619221524.51814-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619221524.51814-1-andrem.33333@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65307-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andrem.33333@gmail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem33333@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C2E76A8B0A

On Fri, Jun 19, 2026 at 07:15:23PM -0300, André Moreira wrote:
> The msleep() function is not precise for short delays under 20ms.
> Replace it with usleep_range() to provide more accurate timing
> and avoid unnecessary scheduler overhead.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---

We don't accept this kind of patch without testing.  But also this
is not the current way to do it.  Do a search for "usleep_range staging"
on lore.kernel.org to find the current way.

regards,
dan carpenter



