Return-Path: <linux-media+bounces-61878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNl4BQSsCmp35gQAu9opvQ
	(envelope-from <linux-media+bounces-61878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 08:04:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F07566875
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 08:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BF32300B749
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 06:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0813DD861;
	Mon, 18 May 2026 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcuGjW3k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D673DD87C
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 06:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779084284; cv=pass; b=O5fBD3UtgeNa/wLyBquqOIJ6ck/hANP21zBOB1ekCm0VahIwaAW/NcLVaUavyzCaLOxNych57ht2zxiBdS0Dp58hQxL+Z3nZuB18y86mAlk1yqsT1K737phezng4TwZKiK24SO/N86IuhUE1eX1/+3l4MQeBm+8jICFzcoks9Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779084284; c=relaxed/simple;
	bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPbIiMdoYRuPbOqXeaYBnVMRGKn/A1WoIcCPTAqnpFRmmqWxgU0sJL8vMVC1DriJglsGGrYDDA3yLIeRwla32d7nz7NYxkAk7VKgTY6va7MHyzSW0nux5HOPOiXRhbILVmySXNqrwO3H71b5UNZ/DfNBOXuGIKmfjHI9BF8en0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcuGjW3k; arc=pass smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-90d042fa745so382095885a.1
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 23:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779084281; cv=none;
        d=google.com; s=arc-20240605;
        b=h8E0o/AFxXppWlsfnTn3DZLSwrT9PC8tmVXpZugaxDWUpZTaHo8rqaYjoqsRnlpIwd
         Jd8i1yDzAEgOYOuSelR287zdH+9n4JL1ex8Ad9GNzJ71ABy8Aq1vMi4mnhFhDJwmpxEw
         BXcq8B4m/SxNqd9SRuK75/IDiBYFTiM4n4nP2O04nUgJq6ru9uO4eeuN1/Y5/ZG8TlQd
         vgri+BayoW+KW2zCsl1+eUI80XVaaHtwyIECU0R4VnYJjiF+qW92+ysD5S6ovZ8Lz0dW
         OaSPlK+7d0F0UCkY14xgkzoNEWiCITFnmCf5NFmrYtNYBxpf8eEuqCn8kb5PBvgG63zY
         I9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        fh=ayjCXK8i8E9MMC8+wruNejhLJgQ7+++xkWpBkRpAQJY=;
        b=ZMuVvRsIwBPmPPBOKlZaOh8Fd4XTGoXJtcaO6TDoVyOu2DoFRrqLPydgji6x3NvSnj
         5pXzc8QsjrthwiLdQZClF+rzPn44e+RDq2GTLsNGjZKT0KfsIEOXnX7SqQ1xDCcy0bSW
         rukxx3gdspVMQHrukm7gg/d40fQ+c0WD8r8xIqkcmW7JssETSTM2POnO/bMHhA09WvIz
         CZtMVVxjGAFCGqJ/zg1ZieoZh36kevxmD8zpCZr1Clv9/w8g+6qq4YgWcU+KTcWrkSDJ
         FZcvRN9SidNJvjwekTT9SkoyLDOhtzDgAYoR+An9Hkz7QZ1pVzDVMu0+vA8nW+6mVlVj
         L2oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779084281; x=1779689081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        b=EcuGjW3ksN6giWzvTreieOrI3/Ek+RtjruNGKNEibARL3VvwiRAGwCYLHq5Sgs5jqG
         Y79JajtxpYqQ8Rxq2Ryi8dZUpxDEf79K0T6Btob1f6+vI/2eMeGd2+42ZLSRnNgaHzpr
         xdP6rgfG84nBfh1d0r785k1cgmyFfMhzZd+Ir3RUAjZIB8srqliLWovP/lCQHjp8h1Rr
         ebabfAnnmGpUPpssYTDHjq6hAiQ9qshfTTY3qxTjUhS7M4txMwQiIc5Y6Kskkm1XDJj9
         P2o97RAFnj9bpzBMlEE5DEZH+RNq1UXk3JgS27cF/hAYD5G8MgDqXrpkSKu4dth0M/PK
         MknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779084281; x=1779689081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtHgeV+zQJIv71o+QEkDovvRJUG44luhjTRVE75G6u0=;
        b=HJ28fbNCgAQSQulBB30fNW0WMMTxgFAw5ZP5Ry/qAtY9LcGUy6uAKazfN9pkMTmZAh
         Hu632hvxQzPZq4fApebFe6kgRnpnd2M3C+2rSYiwqc2KyWJjZZuS8JeT1vtL2oDOXuBq
         JsSXi2iRgK29kUGKNxRjb+LhIjvM6K9ItuQuRLGSN46s6pCjbw6TK0880mx9oY8hVRAe
         kdRYEzez6+6UVgWsQRc3JZfCkrP5bdjfz2kXYPZHXLBB+BElJjymDiBUfL3I308bsvej
         RqyPm9VBmPJkq7LM+R6XdGXxkyBQXpguq1tnEIGRBS/AJlkuNberRbEUCvNJLP1Yw0PN
         LPVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pKr/zwWUmNtspku/RcmSjgrXM4pQ6vUUhd0sb2pTKBVJjCNH46nygTdY73bMPuZnOaF+9b0dY4xSVYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYc+eq+oKj95qlN8JGQTQ1hYZoCXQZI+D6J8D6wRxQw9uw1Fys
	a6HxMxfDzP1JKfYWEPXkM3WUPafVgG4waiNLle36XsHaFiCqJVoxGv33CP2NhALJpDn9u2PqgXd
	AVxTYE6uJT4SOF1PwCcK4vldg5xZ5Hjh+MuhqwUs=
X-Gm-Gg: Acq92OEqEdd7wgNbtuwbm1Om+lnpEIboeo7P/Nlc1AEjjsgHwWzOARMMXm2My39yEIG
	MEjPdJdCpFffuT16cK+VG3Dg/MlxYL8f0k1DqrYPYkb36rBPRUklhRn9t0M/exbpwHWuP2YVV0n
	iC5SORvZi7AWLP5QNdUSJLKxY2LP1S3F2DmoBI0opErT17CG23U1fBFXfeK++ELXVqU85Zrm5rh
	19+BKmv52l7HIg6Ke0RSPiR5pWGCXOWTTFFt1E7mP5Oeg/YllJuwtpsrXgZq8NrbJ+ybIsrl//Y
	eCynteEmd3BMODanDaNU5Xj2iZRr8E5bCwSDGX8=
X-Received: by 2002:a05:620a:410e:b0:8fc:96f7:fea5 with SMTP id
 af79cd13be357-911ce142977mr2053074585a.20.1779084280878; Sun, 17 May 2026
 23:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517060511.231437-1-diegomancera.dev@gmail.com> <agqeyhCD9g7IjqjS@stanley.mountain>
In-Reply-To: <agqeyhCD9g7IjqjS@stanley.mountain>
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Mon, 18 May 2026 00:04:30 -0600
X-Gm-Features: AVHnY4IBX1C6cTNlrKPXa2psS5dvgVqHLE41K50sutelMdmLDd_-PPa_4a1YKBI
Message-ID: <CALruWrX5Cg2_Vy7up35AapbOAoEjLW5zaWqSxNqKriVaGh_bww@mail.gmail.com>
Subject: Re: [PATCH] staging: media: tegra-video: prefer using the BIT macro
To: Dan Carpenter <error27@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 83F07566875
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61878-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diegomanceradev@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Dan,

Thank you for the clear explanation. You are absolutely right; I
completely missed the sequential pattern of the values being shifted
into that register field, and using BIT() there obscures the logic.

I also appreciate the correction on the commit message regarding the
signed overflow.

I will drop this patch. Thanks for taking the time to review it.

Best regards,

Diego

