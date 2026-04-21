Return-Path: <linux-media+bounces-59239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFv1MLG952kWAQIAu9opvQ
	(envelope-from <linux-media+bounces-59239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:10:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C958F43E68E
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B9A13014A0F
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB4B3AE6E8;
	Tue, 21 Apr 2026 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+w03B/x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C63A9610
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776794996; cv=pass; b=RfCOpkME+9BZdUjV8qsBuT/wlZcdmRS0q/eX58H4a8s50SM5vpBpCNGOUsc8ubsQJY4CdKHXRWIxKJkRFNHBS90FzQNG/3NhyUapii2BCAcSh7UpRxDkzY5hKrmIf6xb/ZByhNVSXBav+PlZnIp/9NFtBCouz+5001E0ReUkhEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776794996; c=relaxed/simple;
	bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZPO/lxMBiqlYAn+NAVrGtWABMDrVcKrWYU0HimplIxa2i4j8D1OcwsHTjqiJH6FlwKPbDugLdVvE8cvjKFVK8/8UTdobS4eZyJA2w9Zp0ZQkFsSviMfwz+wt8wa/NmO5iPTk4ftUzkh5jNQkhf1DK+CijLY3ThTpr/d4FIccX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+w03B/x; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba7fd666666so282181366b.3
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 11:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776794994; cv=none;
        d=google.com; s=arc-20240605;
        b=asN+04Vy6WqLfpH440Uvy3+WjgpeNb2s885ytXn+3hXvDBWUCs6IOYFkTTSHrZe84s
         IpPg6ehSt8ijuw3fmZmhKC/hCt1QGm4X22oOh2UT0JDNdgTJAIPtsUto/ebxbPS6joQp
         8hVj+Z6TzD6ALheRCV6elSiOolgbFV2kQdyDooTOpXHps6ka95eykPr8tyhGpjHkxPIt
         eO4SxHclSrXqn34WPtCnw11/ukx7O9XpXnkahRjFaw6d4NIA3rblNaCECpQTMrd1KI/N
         NQpEf7iBh2g/689cYXf+0SUqYhOLxcVevyZk48/i0wB4pRchCaicB6vWQKRIWrbCbo31
         EJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
        fh=WfcvG0kKQD0imu9zFZuO5rO98GtZ1Mhhuxz7fBHFkhQ=;
        b=Oaib7r7sRIgN5ogS5dXsdMcOGUAhyaKDXUeYbJHPzd7lP9jXSID49UYK2gTxe36Gqv
         l8hvl/PBV01ubXUs3suROZESCtut+XKIViDKTt/JUbUsueEIEfytbc8fx1b9XlsDob7O
         mVL1NSiTuaNN48TPQtQNsUgohwL/1kWvUy58VeEjyL99kBJOqMf9NmhK051RR5nWrnmT
         VtWcE2l2/LyWS+TBvLnyMTs7XIr7BRIWLFVwYBlJkb5yEzh/XlkPBv4gQsgOQQPJzpo0
         ModGjojvhFgVwoaK3z8dF1HFbel+kJzzEUcPefqzniL3CVE3a2KyLbZnLjIQrAtwxhdg
         LoyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776794994; x=1777399794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
        b=J+w03B/x+GqIyRkhwu4KPSXYqOYf21E1lXZaNbtdn35YJwJdJW55i1bvNpcLy1Et+l
         QbH6DmaLfPRcpxFAWzhvwn/ochE2kWeyxfgvFB4NjhyTvumusChYQUtTHE8wHPjXoYl/
         J/THAk3s9ULUWhO4mkce1arM9EmRnYjjY7JRMgbG+u6JdDDoJF8btr3WAdkwe6W6eYA8
         qwbEoOcrqq6X2bwzNtks4NNGpUNqUf6j/EInInlp1F+hPr6WX5LnaMd/g72oj/gyZa3x
         xs9PEcntgadwEPSy3bOgegUQ7zGLBxLcZCsJB+zFdVHsILrIMLibH8+kUDr8ffR8Cocq
         OqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776794994; x=1777399794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7w5S79RaygAdpJnFfT/iKhfG77R5Id0eXx4J/AKxDN0=;
        b=Db1kMAIWSLizBo+xSHSKcyQPUrg+sm3e+HU0sF9HnpIGN+k9jyRPoV91SnPvQ3Pisu
         2l7L8viG2/tFwY/FSyymfRIvHZAteWZ0x4E8DgcCEtEFtLXboknhf+djnwdtHJYZyt3F
         vREtFsXMxS5hHS2x2BPGxqe9OuYnTkjxZehGl458fVKIyjmLLmCr3rraYmS0aNteZ+Kg
         VGhamQSG2+5p4qpb0BoNUVqhMHbIKZy/WzmEeBr67aLpzPDMlgFSEOQFUYZ+GLlUKI1O
         Gi/PNh5mADcUu6qMY7Ira1p7okHr378zn7gWohHbnn/cQpk+dOuGdxRrEG1dN5NA6we4
         i5Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/4fB+MUdLXICW+GTonEjlhb4Fc4XCQWGKOuWQTYolKGp+L29LPgQoRfAD/q4Yp9beRsM8dKARPtj5jcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8TVyiFxaO2pSxDRnr4h9OQgngjfeV+aUJlmXkvRIlWhGrNHHN
	lHR22gVVd4IrWa2MQR7eZS0ouE7ZYc0iUWdTJ7JwlGwzFhaEwUzOTmRyOrFzWwiZm4miEOjsYQJ
	mhbjT+1jXFCYnQJztwyRYcs6IaKt07Eg=
X-Gm-Gg: AeBDiesE3fOhJ6wI0j8TwZ2irdlsbov7QL6/G/JiHjERu7gCeGYfLcKjJLewKSCIJtN
	C4VA1xAl+MHPnfMMxsAwVKsG1J7M5XU3Xx8CKBp6c8PNw3B8YqQxQA8jyCjIUJQWCghE/uT0HZr
	rOyJikNOU5HGVU9jEwwowyfkzpG3l9b+JS74Hx6Eywyr76qQytc40ucLuyt/mEEjOsNoPDSdcIz
	lBNJFbI0yD6uE0ctB/srmtoIS3hj9B3U6qQ4nHiZt2Jdra8lJjlhp4WhqWbZ3jItXjkvw+SsocE
	Vj1DLc+mepsbp4nIWT3RWvOdFOmxWgV4Q3BED9Inmcx8PX6Cy0f72Oo/OLS6VzKcsCwdceKOdUF
	aWqqJY9EfxM1WF7tqcw==
X-Received: by 2002:a17:907:948f:b0:ba5:8976:5527 with SMTP id
 a640c23a62f3a-ba5897667fcmr684300566b.36.1776794993658; Tue, 21 Apr 2026
 11:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416134214.130665-2-pontescpedro@gmail.com>
 <CAHp75VeyCRCdR4VD8+KM33zYv3OMBSRGaeSE5B2Wc5hn9Q9hEA@mail.gmail.com>
 <aeerOursgkNeoMQo@kekkonen.localdomain> <CAHp75VfVXGeKcuEewuRC0E7tXj5AokWHQLmzsSF+mVQjQ16KwQ@mail.gmail.com>
In-Reply-To: <CAHp75VfVXGeKcuEewuRC0E7tXj5AokWHQLmzsSF+mVQjQ16KwQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Apr 2026 21:09:17 +0300
X-Gm-Features: AQROBzD-fvIDyqY6Xu4_kxACyosvNflqVCM7PA5MW-50oYI7D8HgNx9_t1b9pAQ
Message-ID: <CAHp75VeLDwbcc5Q7Ec7tGkXg5VZtNxbQCVjFo-hM_JNGu3tZtQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: use kmalloc_objs for array allocations
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pedro Pontes <pontescpedro@gmail.com>, hansg@kernel.org, gregkh@linuxfoundation.org, 
	mchehab@kernel.org, andy@kernel.org, kees@kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59239-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: C958F43E68E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 9:07=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Apr 21, 2026 at 7:52=E2=80=AFPM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Thu, Apr 16, 2026 at 09:26:47PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 16, 2026 at 4:46=E2=80=AFPM Pedro Pontes <pontescpedro@gm=
ail.com> wrote:
> > > >
> > > > Convert manual kmalloc() multiplications to the modern kmalloc_objs=
()
> > > > interface to improve type safety and prevent potential integer
> > > > overflows.
> > >
> > > There is already a patch doing it in a slightly better way. Have you
> > > followed the mailing list?
> >
> > I must have missed it, too. :-\
>
> https://lore.kernel.org/all/CAHp75VcoNkEQs7QQLDg8xZjdouNc8Yc6Vjg+Pdqb7LVi=
qSKysg@mail.gmail.com/

Hmm... Now re-reading that it seems they address semantically the same
issue, but for different APIs.

> > > Please, better to help with this driver is to subscribe to the mailin=
g
> > > list and review already
> > > submitted ones.


--=20
With Best Regards,
Andy Shevchenko

