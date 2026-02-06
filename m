Return-Path: <linux-media+bounces-52275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOBiDqlnhWknBQQAu9opvQ
	(envelope-from <linux-media+bounces-52275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 05:01:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6533F9E2E
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 05:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 577CD301AD23
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 04:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B62336EE5;
	Fri,  6 Feb 2026 04:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b="z56W7mXn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BA21ABAA
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 04:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770350482; cv=pass; b=RAjTZe7k/JpvapCKfjY0Bjq8bP/BrP4O9oR4KUutIllP2bCqPr/58sQCQMiML6llXWHvG1fU7C/VAle63mNI4vzqeCUN7lx4TCOwOW6dS2dyh8If7nu83O/y7wYk2C7TeaVzlO47C8ZsTQLxROem64xaw+HE2semDx10f//ZNQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770350482; c=relaxed/simple;
	bh=MJ601fAsDIsKvp0R5YEF5N0VDMJm2LTPx6s6C0mxRJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcsyrS95eUY0SAJvNq70hI1G+5YinDnt6+qG/I7gmD/TFmzHgb7+epn7fCQOP+oUnJbKvBcIIY2W1RSHnahnVlrB735KWNezNJrT313g6A1IsjAq9Rmmz+por2u26H99jePwBTXWKGNBQG1JyUlaiNn5/GaUzjKjh9KYempKIOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io; spf=pass smtp.mailfrom=multikernel.io; dkim=pass (2048-bit key) header.d=multikernel-io.20230601.gappssmtp.com header.i=@multikernel-io.20230601.gappssmtp.com header.b=z56W7mXn; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b885e8c6727so359343466b.1
        for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 20:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770350480; cv=none;
        d=google.com; s=arc-20240605;
        b=HjbaahmFQ8qoxi4enx5uDAuOgErB9FJ853WLUdflt3SkAu3pPhYT1OD9SsrYDZMk2Q
         fQc56jV2CQgc46/6XPwSc6fRx6x0HJB8WwHe/g9McEruW9YtybsNYl2wy1VMGuEnbb3Q
         NafqxAC6A/KQQvB1sKAyvIVEw7YnPxuJJqcEZcyrf+Nu7j9UwllmP1ZT8Fe3AX5ro/kS
         PFB8A3jcHx89F6vmCaK//8v8igqYGjRhvECIKVA7C+Db2iqTg7fqFiAxa0D3Wb8SBo3T
         CtVPzDQmWHgSTXRq6gX7Z/+F53BaJ4fYrDKVD0tssLeLHbm39uKs4f8TT0ZVswLIvATh
         +lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MJ601fAsDIsKvp0R5YEF5N0VDMJm2LTPx6s6C0mxRJ4=;
        fh=nRsmW7uBsbYoFmaeDtzzknZ5NunwrnlmxhVnRij87Uk=;
        b=ccff3J74pEW+RkgYQbIqq/Vh0mjnxpIL1p85QxVLtDDCVx7TaXr9o9Mskqol8DJHAL
         3VXetwcgrf5YYRfdm2hYGdlhDofpd3YypVTZKkzHpWIUNDpyovCi9bsyD/2eO4ozIS4U
         GIWsVy4rE2vLnLBNlbx6L62/vtTI6mvSsoZTjM7VJW9//wDeBIbj8aXXgyPuDw6KuW3C
         OUnZvskqH6pJPfqGaC/n4/whELO3MjPHwcxT013BYGYAvVW5NGxz+Iyh0TE7/DqKEh14
         D8nvG+B10oKfHRN5jF7gY0QyvgUH19QN/Ux000yY5AMg/T8SrSd2x2R2sIg81CBNULZT
         YHlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20230601.gappssmtp.com; s=20230601; t=1770350480; x=1770955280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJ601fAsDIsKvp0R5YEF5N0VDMJm2LTPx6s6C0mxRJ4=;
        b=z56W7mXnPQ/EI/CX2r32x/t2G/QoQm+p3O/92iJd9039MuZtzqkTtGRO1T8HB5B+O+
         7BrqHHTo7PxpJ5WviU5Y1ci8U/qA8sjeA3n8Ao9bPl0tOZuH0yk5FarN/UH77G4FwKiz
         E0XciY69SmGau+GmnYdHQE3MS7G1Fn2CXI9YLZ0r20I0T6t4Wp3EDDLEMeJ/4POsep5H
         pEHiogm5ncEhUP2xilLLYTd7cHMavjrZmAFLAWJc62+/42l0o9ev8BM5CKvGGajsq8MU
         Z+59ExLWwQvPB8zaBR+vIqY8ZatH3k32JoDVmKIhKkNQxO+D9u/XuddsSRnrNToR0TgH
         rnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770350480; x=1770955280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJ601fAsDIsKvp0R5YEF5N0VDMJm2LTPx6s6C0mxRJ4=;
        b=JZdLT0TFLl8mrW0GqiITnTDezvWo/RdEhWOVOgq3BmF+EZRKqBB2Rx0ZkXRGBGw8kP
         FrXJBIOkG7+OmkOSMbKXK5jV07yMcGcNMHBV7DPg32EOLM94Wxu0Myjegicup7SvPlWC
         EvT++j6XLUrnrEjwpwnF0p6racK4Q9mCLTNDY4l/v4xcax2bIa1F3pfKpyLECsIxPrnb
         YlYEcLcnk5STKahjlxG462okpggfwxamS8MGBvT1Q+mwF+UEXxvd/iOVdK/RzmTN2jA7
         LKFO3ezwyFUOQCTykTQerSMw5W3Lj/bf9czAiRX3C3CeJR+PNbpSS/dGH2/xHXpGlGRt
         6FRw==
X-Forwarded-Encrypted: i=1; AJvYcCUALSd11MlFqoTykTbidg+3bq8v9T2tadTJwlxGOqP56wv0b1IKfOyrMy5NF3AYhLcs9LKjy17pAMNjsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+FGjuyn0gpTYIsIZlnGBR0s21Fx7dJp38Tc/jWdDyVSO+Q08
	+F9h0iosborLg9dRZAleZQ0yTw/G6QUluO6HobEW3rxc3f2gfLbpRugaJIJt5EIS7nTwVg0gNsU
	vyoX3B2jUSewrXFrCdp8d6XSDsulGtw83Q5HvqzxATteLc8qG5CHj6ToRwSRm
X-Gm-Gg: AZuq6aIXmWoFq0wfMmzoLyThOA4DZr6t8AthtGjqhgi136CJur86bwC2jVQG0SJu22b
	qNNbAyPFH9HoFDWfFupa2xPTeLgCAbcIMXu3kEowiKxCD4oWlGodJfMXlA6TqGxOOgNKTTj3fsz
	WTNKZE3mr5ERHpc9+QBXau9xP87/FRurKbetLZJ6uiHN2cMBfsEAqGLsj6FgBw78+Zs6DkUEook
	08mOap97oG6uHvD4mhTTlGqKKo6v7vyAZ2gvgGg9ehCOONfDi2nkG7VYbAbfRKJpToqSOHRw3+s
	NT6Q7MdO7JuXw0WbUz5kIbePJ+uPUuKY0Gfnc4hTPzuvLXGvGkJDTa7iqXY14zK/0omRSeA=
X-Received: by 2002:a17:907:60cd:b0:b87:6839:6175 with SMTP id
 a640c23a62f3a-b8eba0e0fcamr374449066b.10.1770350479895; Thu, 05 Feb 2026
 20:01:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201170953.19800-1-xiyou.wangcong@gmail.com> <aYBENSqGtp0XUZBw@infradead.org>
In-Reply-To: <aYBENSqGtp0XUZBw@infradead.org>
From: Cong Wang <cwang@multikernel.io>
Date: Thu, 5 Feb 2026 20:01:08 -0800
X-Gm-Features: AZwV_Qg9VY77zJfA1bdquBWf1Lvd3VC-n4ZiDOq2gALrLvN6wt6DotXnQE0RnfY
Message-ID: <CAGHCLaRmMb9ge=KZucpXRkEbRS-VHxFQM0XyU26Y5Z6bVabLsw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: add SB_I_NOEXEC flag to dmabuf pseudo-filesystem
To: Christoph Hellwig <hch@infradead.org>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[multikernel-io.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52275-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[multikernel.io];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,linaro.org,amd.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwang@multikernel.io,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[multikernel-io.20230601.gappssmtp.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,multikernel-io.20230601.gappssmtp.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D6533F9E2E
X-Rspamd-Action: no action

On Sun, Feb 1, 2026 at 10:29=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Sun, Feb 01, 2026 at 09:09:52AM -0800, Cong Wang wrote:
> > From: Cong Wang <cwang@multikernel.io>
> >
> > The dmabuf filesystem uses alloc_anon_inode() to create anonymous inode=
s
> > but does not set the SB_I_NOEXEC flag on its superblock. This triggers =
a
> > VFS warning in path_noexec() when userspace mmaps a dma-buf:
>
> As last time, I think it would be much preferable to set SB_I_NOEXEC and
> SB_I_NODEV by default in init_pseudo and just clear it if needed.
>
> I can't think of anything would need to clear them from a quick look.
>

I agree that setting SB_I_NOEXEC and SB_I_NODEV by default in
init_pseudo is a better approach.

I will send a v2 tomorrow.

Thanks,
Cong

