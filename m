Return-Path: <linux-media+bounces-52175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLGrN/stg2kwjAMAu9opvQ
	(envelope-from <linux-media+bounces-52175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:31:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E3E5268
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 12:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C320300F682
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 11:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B76F3E9F87;
	Wed,  4 Feb 2026 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XQKiZI+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361921770A
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204453; cv=pass; b=fSfKT3FVaAa6P1fDVXN9LAbnb2PLBeR1IHYtrXg4c+O8fBPlhPm1IuceSKFHVuawWch+JF+ifE4uKoHDQ9hlODZltPDwVOsOkpUUZ7fUCqoq3lpvCxYxfoYRPJ02zeNbf78qs833ISalpT116v466ChQA+6EnlsJzwDrUu9QBGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204453; c=relaxed/simple;
	bh=74qF5WYtNluBv9V+tproK+d03vBGnSzYMLmzjX+aX34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfLcVnNzNfQgJogr3kt37dZvm/B6Ga0YOcODgG1HCGXVENW38UZuPFdnSmh5jCSOv2nbU7eg55pLsMCeIgHrvjHX3fj/K/E2bxBFe0neZXPiPHvBUdiouylZQZCbPU05IBpCEvWto/oaFPHCODxjcavtVbn1O/dkh9CtweUFfFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XQKiZI+E; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso7008220e87.1
        for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 03:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770204451; cv=none;
        d=google.com; s=arc-20240605;
        b=ZKv1U8VQSsiBkvy4CTshs+xEq+T5sojvz9rQrETTu7A1zSaN+Dqppy2qlZtkL1hU4/
         PustXeE5ETjgfjjiu2+g5n2eQ2HNnmR6LdZodKHPFA3wpFO0YNy0E6iR8Gzy+wCkzMg3
         vec0B2wMV63Sd2tH5qkBH06Wngfcz22woyOmigSdXDycCX0lvJFP8dw5PiG33uoIHJ98
         POWDAA50wlzJLb7a9Ng0RcTTHugfgo2y37ZCwCxtrIx9CI7XxIjqOJhyzbEL7RBPOpbs
         m+weF9cyxDWon4IIyDgDZWW2osn1axHE6tjC++bMc049y7imGoBM30f2SLscll7SE3TX
         Oe2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B4rZxWlzr3hbToQXm6BFLNjZ0ka/HL9dCbjF6/QVtII=;
        fh=cIi+2lA7pB1Xqte/dwbpQfQxFW8yygiEt4fGqTICODQ=;
        b=bVYRa5PM9+xpHnoeIJozNSltkhhSrPswpy/TpmWsHDIqCmZMsGpci7kWV7SV9NoG5c
         ieRuVzqrPI+lm11cDTBwey59xaNk22nZRpVhm4eE+twEEm7dmvegaeGM8oqJS2xpluUg
         qncB5Yp356+FWIyBZY7rHUGNc4rXe23PKNieGYZlrN5/iK/qNKZ5F89KQTygmnSpFgSH
         aCLBWDQAJGCg3vkqRbNMCMCwau8Qe314i0xBKutNBcQaUjK0RS2CcubXF635YH0zIFrQ
         GTA9XdzwG7ehzZwR6LRra1sbAueR8AnxeYykiZEUDVDtLr0HZPWMs07WRH7vA9FP0e9k
         ik7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770204451; x=1770809251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4rZxWlzr3hbToQXm6BFLNjZ0ka/HL9dCbjF6/QVtII=;
        b=XQKiZI+Epk9a9DrzMdrnkcxnW+XjfDUYE6aYvmJtwk3r+wTiDMJUpbPVjJDWl5xvQh
         hWjI4V5cf8rpsGLpFkCfDGO6saTjDTb0LqyjXGi1D6HdHk4zbQd26r1YiNuUYliQo9Om
         2mmEMXIj6BxW0KDygJqg75QkDhcMJCbI4ngU5JMBihPXKPFtUVKIiWhjRBqAsJ775SuR
         fq9bw18LCD670DS+pwtBaYv2BAuiVm/B8BUh4DKpGv41DvPUd00SC4d3Znqu8/vRsENp
         /Je7KY5pg5sLYBCCs6y/7zoAp5IYJC1J1JenKGriZlPMLS5VbaL0J6H8LUaAKKdIuNZF
         W0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770204451; x=1770809251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4rZxWlzr3hbToQXm6BFLNjZ0ka/HL9dCbjF6/QVtII=;
        b=XJoe/p3IJd0OZ6eI6S+RuV3IBngocbuqiAWMlKO/Usb8wB62bEcpZIyT8OzNXI4NOr
         P9sLxwePQPJHLSIhOcu1Fwm5MKeSy3aNqya7mlN2sHB3XAb1Aah1g0D+1PUwP8and7IZ
         d25nAp8+Oz/cOxlickQuTQ+PtmMzMc4SqA/dwB5eBf8oibf341BznN0UFeLXXZDin0PK
         gf7oEsytt+2GtC2FfyL/xe3DzQnHwY0eD/ocQLeRL+9sJhYeHyzj28oTTPxbYpTfMyDz
         19GtWhevS7JIdh7zefb7+QKBArytlbGylSE6t7+9ynESxnjFZbet+E7hoE+TjmcRxVa8
         o4bg==
X-Forwarded-Encrypted: i=1; AJvYcCWiUvjNyBLlJBNvexzxPUuIEw+GFKPmZRSKYQmHTcL7A7MTDZa1/5CFApQe0ZWfVcJRKCxM9Zk+eyGuug==@vger.kernel.org
X-Gm-Message-State: AOJu0YywDcImuklLlvAtS1+8hIr5GTLabX9WJrl0SmTGAMLjSgAR1fX9
	So031sseDl4+d8uiZxN1YQKxNhYxqyaANZw+teCMHp+dGeYT+fEZTbAiu5e2QCZ8OdakEUwDDrd
	s4aT6/us3GofoHrVHdJ74Ay1EtBeiRW24dvdGhC0wGw==
X-Gm-Gg: AZuq6aIdg5vKU4V5K3Uv390rSuaohxGi5imUEhSEY/0fTViw4vT1eXqy0aapIxZxjZG
	7RVjwH7TpUHeXD12Blu/A5LO4tdl9QwMzZIQj8eYyq3cRt4b2/RH3t1Jrb/BMbbZAY8j9O4xh5f
	UXl1j1RC0iyWGGTbJyK74zb91qOqdUn6fcRYLVPbPLz/FatAakSF4j6+fcG6CSK6YhBNz5sPyny
	/VCNANs4ASeK+B3GImzQfk94GXEXRvkAIQk9esxnQLgKEx6i51RuXFVLX7+0yctUwLjgEuS+i9D
	ZcOg1BeVYal5Omg8HNLBgTG0tlEl
X-Received: by 2002:a05:6512:1114:b0:59b:786b:2a18 with SMTP id
 2adb3069b0e04-59e38c4befcmr963625e87.46.1770204451534; Wed, 04 Feb 2026
 03:27:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141052.221108-1-marco.crivellari@suse.com>
In-Reply-To: <20251107141052.221108-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 12:27:19 +0100
X-Gm-Features: AZwV_QiNxOPo_N3sNX2tkgsncTYmSMBZxqHlsjMYpldGmbiB4p26DrQrVPVlu4o
Message-ID: <CAAofZF6PNgMmwRFLJfQtukUQ4woTVcxfUbmDszh91G9JhypCRQ@mail.gmail.com>
Subject: Re: [PATCH] media: ddbridge: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com];
	TAGGED_FROM(0.00)[bounces-52175-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:email,suse.com:dkim]
X-Rspamd-Queue-Id: 1E1E3E5268
X-Rspamd-Action: no action

On Fri, Nov 7, 2025 at 3:11=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/media/pci/ddbridge/ddbridge-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer

