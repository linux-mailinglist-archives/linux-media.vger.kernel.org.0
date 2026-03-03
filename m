Return-Path: <linux-media+bounces-54252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFy5Ewh4pmnxQAAAu9opvQ
	(envelope-from <linux-media+bounces-54252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 06:56:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF831E9599
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 06:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B198C303D31C
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 05:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAB233120A;
	Tue,  3 Mar 2026 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8nQeNXL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950362E2852
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 05:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772517370; cv=none; b=j8nITDovkdpOYZeeqi4UIk+iR4dtdApK5N0OINtBzSm0is2ZxQhqw8RNYhqJNdTx0F1f+6X3T4c/W+rwYlTNTBdLz48dANErlZ8cZig3FNKgB74LEFkM6Cmz4zX1XK+ElmGZY7828PlE1FIyrA6MnHqRG0GmiZnRF+8SSM3xPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772517370; c=relaxed/simple;
	bh=0+hgfD3YvJ3pblt22rFc/nZgTFnba3Q6xnVa+3h4TDU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=t1YBxqvEr2z05RW48NFUaoO1iRzo458iX7zW1PDpwoIMEIYCTNy7IdUKB0rwVLGSYJzKjFY2eL+/qvKW7zPULh2zUa/q+CPuaLu2gELXKN3CnDl443ieVB8q7AasCz2Qx+8XIpkypFx06aq9KpXkKfLRfh2+2WWBoE6074UhRnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8nQeNXL; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79827d28fc4so47855007b3.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 21:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772517368; x=1773122168; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+hgfD3YvJ3pblt22rFc/nZgTFnba3Q6xnVa+3h4TDU=;
        b=Y8nQeNXLU44QZaom8a/KgZ4vcGm9eCrfBd+Y+rmVIWRdNn0fbogEpoeIfwgTIXFRJP
         f7mDSiD4A9eknCHXDRw5MVb3egffqhr8EEjyOr2If2SzDKNfMgsTP8gkCFGqiTbmLPAR
         g5AEiCiX353USLVui+Nzw1t+w51HayKuocvB8ok0SJIEgvgOB0KWKHhcOxykanYXWNA9
         Sts1tAyh6Iy35uFZYuogt4/yjectS41M0M322m7UR7mDsUPEY5WQQo4iII4uCkHZpvJp
         Kyyj1T4VVmF0sO9EWZ1cmR/n0gLN1g3Igo7/lKcq09U05XvsZ+p+Q5jxKngkbOg+dQdd
         TIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772517368; x=1773122168;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+hgfD3YvJ3pblt22rFc/nZgTFnba3Q6xnVa+3h4TDU=;
        b=n6uGNTiU/JdsTt64rAyfY6AB6FHyPIGLqL5Clt3cBY4DsZsZ5G3cvV3TYDhEFOOWJm
         r9EvTHVmMrfnQJhNmXmcsnlM97OQuqTC5gUCnhA+zqS5YpVs8xke9Ok3pNTIkoXLvZ93
         nrewH99/uYnEnCuu34DPh85pTNCEe3OZQLnbrWr7OwM893Z3ymdcDXyMH/hw4aMVt1LN
         3BfrLiZ8K+M1hcBn13LBNXg8FNndYlguOOaUUWSKnM+mvQCbbUTr+Flaim61wsP5mToF
         gUwXZistuwcVzxgGYdaopL5WmfqQt5nXKK4znqxrPz1hBWVshomEj0sO+iBm9xwUp1yx
         umLA==
X-Forwarded-Encrypted: i=1; AJvYcCUURerOdTW5TMtDY/fxSeyZeDsGIFtHx1oJBJvKTQdNq9jWyTo/7tqRAEuqkeJGMwacubW/OLKvVphuug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwweWl7WuRY4AHfOrfKv+kdKep5n2INrCTT8FZBfr9MAGIw+AuR
	82f4FG0B/qKTslPPgIyS6FZR0k4nnDS2/U3gyfFVbcnJFKrz0+Dbk88dGNoFvCfYEd0=
X-Gm-Gg: ATEYQzxGkrhMUd7oZVG2WlrYFjf4cPBD7DFNZqZTJkTObQyIt/EEAIhqYlNc9OOXEi6
	jwMAT7eyNlaGYyMP9wXJYn8ZTb5aDM2AzvMKJg88dENThaXOb/C5aTRuTFZrnusIno9TwKPnvnV
	gfulEkt2KvlQHS8crmoOJE2k375x3z5dOc7DPQnA91xxJAgT1KCmwUXhrVJiZf01HvAT1YYYAhs
	mHYQmjlPVSd2g5VsOeRIHWlK8vafwR20Vrlj1yKm6/iRpr84O2saLVQHYvW7ts5FARsC4h+nu9G
	XcLJaKgOK6UtWD8AkGJ5nQebuh+hfqi3jBkBPgBSdbQTKjN4v6bkhgJJC6qGc4WxNAoN6zCCnxz
	gvhatz/w5raLF+4aKuRQqwdRqYgBx23oP9VyWxgmwWiyo5jygP39tIC//fnYLYdM2VQmdY6x0HA
	TbZZCZONh+4YkFCYkcr2oWwnkp7dHOouzXJLdkLQWMoarsKraqVL2Nnjq5or2yfQA/S6+YiUh9f
	j1iozHBpjOP3HRkI1c6K1Fq3PXGtXTwrToN8CyOtkU=
X-Received: by 2002:a05:690c:d91:b0:798:2cd4:5567 with SMTP id 00721157ae682-7988560871bmr131090467b3.56.1772517368533;
        Mon, 02 Mar 2026 21:56:08 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c3fe5asm59897327b3.35.2026.03.02.21.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 23:55:48 -0600
Message-Id: <DGSWYKMCBGO2.33J7GQBIYMEOG@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Hans de Goede"
 <hansg@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Andy Shevchenko" <andy@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: atomisp: Kill OP_std_modadd() macro
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302143040.2495464-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260302143040.2495464-1-andriy.shevchenko@linux.intel.com>
X-Rspamd-Queue-Id: ABF831E9599
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54252-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 8:30 AM CST, Andy Shevchenko wrote:
> The OP_std_modadd() adds no value, kill it and update the users to
> perform the necessary operations themselves. No intended functional
> changes.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET

