Return-Path: <linux-media+bounces-59312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Eq1G+Gu6GkhOwIAu9opvQ
	(envelope-from <linux-media+bounces-59312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:20:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E184452EF
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 13:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F62F307C8B7
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 11:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730D13CF690;
	Wed, 22 Apr 2026 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmRNr1R9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16383CF026
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 11:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856623; cv=none; b=mhTF/V8irWL814n8RPQ8uPQdRPnIAJaMDhtNpJGxMSAPUnpUmyg/WLw+QrT5EDwIzMyL3/beiCrl47vegDCO2rA83ZkMyx/9pI1alATVuZe/8iM53iV6kIY3Lg0L9y17zXuPNI/rkiQI+6zsKZdciu956KvT3euzjdMOxDOWUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856623; c=relaxed/simple;
	bh=nikLaA78L13NJnXz60ZFuoAdhal5Om5tpindurSqR+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHb176gGR6noVxN1N+dhs39Fuxh/p8Nt/LMTganpsM7oUWyxyNcnIFoFdDQ28Y19SbbVYYPqe5kRl0jUdj6g8tSKovmXT6x9wO6s8p5pmjbx0arFKF1axKHu0x4Jdkm7Pt6yJ8uPFqDQKN0CRPy3HEfi19on1pLdRr6FC++If8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmRNr1R9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so45033215ad.2
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776856622; x=1777461422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2n2qVtDxXB1QkZ7SDG3S4ms/93RE7PN+H3Oc8MJU/I=;
        b=kmRNr1R9nk0XDGxByqrWRuolaTTnIpX5jVILr/xtjbPTa4Lv5KqTYML3xOsxbcHKW5
         ZI0YIcmA3MNfAMBlI4QC3g1CeXxgIW/s+tVSKLM90NkUekKRu1Zb2dXIL+1SaIrWXdxF
         vouIf0LTB2Czyg61yYg/hZKfDWkCiAGwkAiJwZzQ6+sqYP2zDpdPgzql8aevNYsyae1b
         g5hes8DqKh4z8IB/WZE/w86Srqp1Tc7fgi/whtqwdYCPHifxCCMIgSwzCEz4AkmT4B5r
         erX+7InsF9G3bIiCnWBLgf5Hhnk317v1nEaP+DfCSIWtHwhw88IxOXPMNnMbNSJG/N2p
         f3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856622; x=1777461422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2n2qVtDxXB1QkZ7SDG3S4ms/93RE7PN+H3Oc8MJU/I=;
        b=PUKvCPgimLSSxSMy9JG4zW4HAQGO87/8pxaRWYOcHy4K+CUEIsg4+2VgIz5QWEFiy0
         CfbLnqTzY11gCUTt3gm1RZE/+SvC92b7wzqhkcnEvlVrESRiATo7EmJ1bzyU9H0m8sCa
         CnynhOq2LLW/QxhRBHn0pEBKY8xzNsmpew2TW/zlJstJT4TVrnHOQ2Eyxwp8/Pace5G8
         4XAng1t6QaYkvLN+NUiJVtFTL62nRrpDYrtb9KzKsNdXcF9q/lUfOXbvorMIvyNGCzdQ
         WzkZmyXkEIz08RKtmQD3IUa+oo0C8x4AVk3i/Dl9bJfhbEOOq3RI5eBdC5iFyEIAiKLv
         lK3w==
X-Forwarded-Encrypted: i=1; AFNElJ/T6Jua2F5O+irpkHzfIEgqLwr4V6Rh3PMSNBmtZjOM1SCf1IUNaIIfumoI/AMDd8J3c3Vc7TyExiHUPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5fDMkD0r1X4m8Jq6moxG5pquPUXXM8VsO49noCwqkVtaLhT05
	asCLaozTePTxXMst9rCxlOwm1zbO0JiHM8C0UbTneS6dikag5I9sTMqw
X-Gm-Gg: AeBDiesjshwGwH54L7C6B0Xl0ThB39UkJXibY1JuhKsEAJs74mcGuDdyB1hVOcx/99H
	LdcJkjYtKVYKEuYM4hmK7m6c92N7+IyAAQPhnxbTUlp4EZpvKdag0li+zs3jPGuYIixbG8HbzJc
	2uuybbKbmKHYMAaBOF7nUUXUCaHIA74UsIxjp4fuuTaBbhzMrIDaW9Xcy96PZX5fkVPU5xn65Ay
	FVoLVUHFhoBt21MMd9UGLfQSoz+tHVTCh9ziDyJ3oFnX1AhSWWOOKshdHqvVieNWKKAVvXRq8XZ
	uiFkBCm/pd9of/AHBtX5Vmq5gaaUVuF+ZiVAFuFK0tjROkd1eNdhrJ/XH/ldET8aNnoKHjZXFqZ
	jTEMkg2x+PF1rzn8ZYCPqlTPCHTYNkCmmiLom96z1+gNEVQxTEYq/Bl1Ch4EEeOI449JUA6+FAq
	ZzJCCu/mSNY4F+fXlP2ksr5F3BBjbBJ3F8lJFSaYLxTxlw9JLaKx+1
X-Received: by 2002:a17:903:3905:b0:2b2:5840:80c5 with SMTP id d9443c01a7336-2b5fa007e8dmr230079155ad.37.1776856621760;
        Wed, 22 Apr 2026 04:17:01 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cddfsm232798835ad.49.2026.04.22.04.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:01 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Wed, 22 Apr 2026 16:46:49 +0530
Message-ID: <20260422111649.9604-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aeinCTZwB871zRAd@kekkonen.localdomain>
References: <aeinCTZwB871zRAd@kekkonen.localdomain>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59312-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0E184452EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 01:46:33PM +0300, Sakari Ailus wrote:
> It may well be but the rest of the driver doesn't appear to support DPCM
> uncompression. Rather than trying to pretend it does, I'd instead just
> remove any references to it.

Thanks for the feedback Sakari.

So if I understand correctly, the right fix here is to remove all the
DPCM-related dead code: compressed_codes[], atomisp_subdev_uncompressed_code(),
atomisp_subdev_is_compressed(), and atomisp_find_in_fmt_conv_compressed()
declaration 

And in atomisp_csi2.c just keep the source pad copying the sink format as before, 
but drop the FIXME comment since we're explicitly acknowledging DPCM is not supported?

Please let me know if I'm on the right track before I send v4 of this patch.

Regards,
Debjeet

