Return-Path: <linux-media+bounces-67348-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 66rXFWkkUmpwMgMAu9opvQ
	(envelope-from <linux-media+bounces-67348-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 13:09:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C17415B0
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 13:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Q7ZcXbCh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67348-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67348-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21625301E213
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 11:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB943C0A10;
	Sat, 11 Jul 2026 11:09:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954223BCF7
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 11:09:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783768157; cv=none; b=VEnEp9qCPmrAivwuVWzf5k7ybwgXXuDeEEXpVU4LXZlM3hENiHGbJwUcHsvl07CL8HX1cb/8jjfF60dUBPt5XapwdjkiMrNXzFOT2BogKhW5WZtAWc1SwVeFsS2LD916Z3U9VUfo24fTh807ZLgOhiMGH3oJXuZs7xGZXJalvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783768157; c=relaxed/simple;
	bh=/ct3a4d07mIPp80dTOTKKFNLheltHpdu7cQ/5IYNZcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br7W5TpldDI6jyHw8ur4keSI87HbVXP6aNCzWZeCzGixdEx29ln+Dqiv8On63puSanjEBD3Ec4LarmvvrTu/R1sPrJNtooBGXfLr6NNKBTfhBirNGoanwtL3d+zMj2nFAEfrNLw5mBnZdhBxPFisNyr2RnXiBC2vnaa+X/g9Rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7ZcXbCh; arc=none smtp.client-ip=209.85.160.46
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-44d2204d195so632603fac.1
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 04:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783768155; x=1784372955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ct3a4d07mIPp80dTOTKKFNLheltHpdu7cQ/5IYNZcg=;
        b=Q7ZcXbChP/8HaE4d5WuMPSMWYKJEO6q/2Rd5YC5rOufFz07AXxQBnsc9MdA7HDZyw2
         8Y/bdaKC9/crC+msjIZWHn8Ffz3NTIsDOGCM6jNiV9L9GBFVkdSEJt7V1BiUo05OBOAi
         +JrWysMQPtRJqfLmvyya1SPrVkuuwnr5tKKxxemqlJyWyJAcHA5o/6nu14gHxQXtpjV1
         CZPpA/pLwfxKY+1Bzs6Y8ohPu2daTWhmbbgBUuTLOYvv6BW1NiCYQiF7lQD02ytTlqgs
         1F5sBikIFkvT1pIR2MdDccqOe4sd6eEGCRSRsWK27SZoxi1rODPa95qwTqrtYtqwhf+q
         f2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783768155; x=1784372955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ct3a4d07mIPp80dTOTKKFNLheltHpdu7cQ/5IYNZcg=;
        b=A+1oesRyNXONoMNULDRuOReIlr+SQL1t0wIbQjUJ21yzTRH9JmDlk1iWxZ1Dln1BOU
         bKj+jmvRsaawf8eK6V+mObK6UM/Cft/PhUXuMzgpn/1guX6lbNckRwhCuqsWW8fVo6/7
         McR5C97pqhWNfhogFIOGltsgCk9Dket+glJXic3xo6Uktn5ZVsYiLk3ddLNvHxj2/cGv
         vgFE1HGPckYxyrNR6d+Sy/FJ3Hl2ggm7+7fLRm/aFzYgkVpEGRzVtS56zsZg3r47/aOB
         pSCVBxlvZOrfF8IYBL66gKc6SSadQyOHsAapSVixD+mIiJdJFiz5vtnlL6KrboKaVQ92
         WSmw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZvfvrhustoEbMBnrtVeSrAMISoanPLHgVGPMrGJCOc31XT0VGW6uflns7bXFsrgCAUa+jWqTz8N3AGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdghMj+wbTJAt1E0e6HRbJ7s8X/Vqn8BMSLnSJF8ROiPxytCn
	fzQp9q+bL9PJ6xy5KjYJqfWgzNibZXeYyqgq2kTU6XkAWT+j0MMq4uEc
X-Gm-Gg: AfdE7cnI3UgWTKcUHqZE1q2wY5ryE69DtwSA+R6Un4I4gx75ybl0YItPc8q7vXVbFBk
	7+grxtz+EgJtdMFPyZPsnDze9V1LKTPXF3YmMaZuP2bjm3B6H+2XvFIPp/CQKN67xG9B+5YraT6
	J1Yr/grMvOs2pAL18KcEH/fRELK4GafsPa/nOzgbys7M16h/NQzQ06A3JS2GU4H3R19zkluHD1X
	Jb/6yT8Iqo5woIC1ZQREwMOFZp4MDtJ3ZU7Tgw6WbU1VGC3bunfBNJgwpLIv1pPkyR/HBVupOuO
	CqWh2q/iC00WQ/nlmvrjxgT3wsRoj/p1DWND4KoH6Sm8/EQDN40huhMNjLffSFjQy6PSEEt3BUK
	z05d0PpTWsduJ5yH7ujUSz6NzA/hMrsoOW1CgWXTOGdGTxz4VeMOXkNiQYVN7ScCgwGDexw9pZS
	gqNM1N
X-Received: by 2002:a05:6870:a255:b0:43b:5268:b7a0 with SMTP id 586e51a60fabf-451f1375b2amr1284724fac.26.1783768155055;
        Sat, 11 Jul 2026 04:09:15 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451ff78897asm1123162fac.17.2026.07.11.04.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:09:12 -0700 (PDT)
Date: Sat, 11 Jul 2026 14:09:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: "A. Kalimov" <erqeon@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, andy@kernel.org,
	mchehab@kernel.org, sakari.ailus@intel.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: media: atomisp: remove unnecessary
 return statement
Message-ID: <alIkUiNSk-GbxXDg@stanley.mountain>
References: <20260711110152.66188-1-erqeon@gmail.com>
 <20260711110152.66188-2-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711110152.66188-2-erqeon@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-67348-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:erqeon@gmail.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@intel.com,m:linux-staging@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A21C17415B0

On Sat, Jul 11, 2026 at 03:01:51PM +0400, A. Kalimov wrote:
> Signed-off-by: A. Kalimov <erqeon@gmail.com>
> ---

No commit message.

Please wait 24 hours between resends.

staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


