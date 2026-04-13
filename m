Return-Path: <linux-media+bounces-58633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNIQFTSe3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:41:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B85623E85FC
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 09:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2395300EC91
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 07:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD8B397690;
	Mon, 13 Apr 2026 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoCsB9dH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79D396D25
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066096; cv=pass; b=VB4bUdtxv/C8Rr/3yzkPjSr6uRmWqjXuq0aiXge9ZKqSr7gxDOEC9B1Ln7nD7kL3286c8TcgklzPVkrABHWdQ2EO++Shsg/tYAwdtPqcP4Ohft8IqbtSvs85JHBpWrcdC92Mh379REZlCSep5sXe/oUWZtHlkcGqL8lqE7A2H3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066096; c=relaxed/simple;
	bh=frLCNGyhruHajehA2tRK+zfH+CEyqy5ChitPWJULUcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeyBtWr6kPHARuom7NmoN4hJF7M3+J+8oIllbKDpw3gGUp3zK1TP0FyvbpIQnZIh/wMyelldbT/aVwNnK1izv3/1LwUpFGGyLyMk2QICFvRV/8OQYGQ+BHXnfOvP8xX/2ku2RcglfdwzsW1kUwuQixewLP3GKcvDEEhm8Um8tGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoCsB9dH; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6715594a4c2so879799a12.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 00:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066093; cv=none;
        d=google.com; s=arc-20240605;
        b=PdhiU5jIr77vtg3w7+ABl+Lolg7UQ5Pu2KrjNulkJvsI6yJj19m6fx0o0EwJOdtnCJ
         Mfrsr2UoQrT+wY0jML6j1ZNPz3TQo4GmYX7FySZ+2s5rL3pqA0KIRvr28aM0ogZYOyqN
         RMqrMx4oy0644YPfuVo49zPYAdYGo3cvXJ6Ec5ib9qIGwGsFkn+AgZwSKG97+skORap8
         tnULTckTT5XTlsfzUljCMm8cTo7ONjStn1u1gpD/JsTJk8WJq9Ev7VshgvBh51SW5Mes
         RN4u9MiRP/TvSEEvVnJQovWyAfGzSBTRP3EYtWfjfktEvgTm76gxrbqMq7y5GppBEU+E
         83hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IJ2wg8gTbB5vb5wi/9vxh5q5ilM1n2u/1JsWPDvfIwk=;
        fh=16KcwlVWa4ws11tOuwVh02qmTWHxxmOyymQWLKS/bZI=;
        b=W09m+GgfSgAQ+tGYXQvgS3NCzzPA9QUxvGrFDjCUlXfddRts6ta4/WJtebjvUn598t
         l2/xBQi3xkPjkJjt1ZpOwUM3lJxSxwI7oKaxjrdZwolVWm9LOHb0kYFIf3U+St1Lre9j
         EOO72yDQ7szmCvsQyZrW2L3FFZEdyDRfh5QkFe5JbFd06QiceAhiLgovR3Y1A97jBBAo
         yEknj/D9Iqqxtzcj6+d2Ldu/PzgU/okUbWzYKtL0sPrQt1aDSm5jW9xSUNTKWvPG1PtX
         CPr0H4k+X6uqGfIfeVF8mmR/7RF/G/ZjunDIKXvc93BHZD+4PwdmU/NhlRJue3y1Y+e1
         Y8oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066093; x=1776670893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ2wg8gTbB5vb5wi/9vxh5q5ilM1n2u/1JsWPDvfIwk=;
        b=YoCsB9dHKtt30CoROgiOD+E6eqNXk8AqexBx6IGzSFSHGrrAcnJS6hpfB5gb+wTyLW
         wKNGRlBTY9+E2hw06EVt5vMjlY/W8CMqySYGCa54F7+8R40kl0Msp/Qn0eO/WUgx/J/e
         tMOzjuLrI4pkiQxRrXua2nwpRyO1H807EEspwuWh+iKMyxs/DhY8cb09OXko1AZfMREK
         vGIwM0jZQfQa67s6WMfz5xDks3MmranzZMI2ODdYKe7lQNxioNbkn8F6oC4wG5/TV4rj
         S4kRIaWFgbUx3MfmK/cdn60eQJSsy8xgUDV9t+9GS5qyc8hMjAbe9Vh1E/eBMj+fbNZh
         NMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066093; x=1776670893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJ2wg8gTbB5vb5wi/9vxh5q5ilM1n2u/1JsWPDvfIwk=;
        b=T/ddjt4cCRdEtpdUokehxEqKOqVIAEzUMdV90PPUAKonZc7TrOMjNqyynxhHP2UexR
         Ysug2BW7NwLLStM4evuC3fYP20HcPmlL9oyewUO1UKtEN6XlU4fmBUYbywFMxe/J/F9R
         PdEJIFocNVgngj+a71lY02ZQhz9LYbdtZs32hmehwQIv0vR+iRUrnH9ovpJ+jdYx10h+
         tg2b+2ypQ/4O5kRmNclVcITG81OKpSrS7x1V1En00ukQTJtBbMpXZt2M+6dlqn3UuX9f
         gj395gzgbIcJopuAcFACv0DMw7NzkOd8pweDnqkFni61nazesgeceffbf0VzbQeqleEa
         HXjw==
X-Forwarded-Encrypted: i=1; AFNElJ/O7aSauXfhpp5GSc8AfEnVKSO45MdSCJo6zRK24f3tDQi7wSUKBkVSv8qAXXoaW8qwypfNE5ehXE+Mrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3lcvZIppsmGuT105aWcpkqywC8LSPukIKuucNxegQysR8diNj
	LbAhdmiR4s6871EkawkP5QcHlfjZHYHHPsoVQOW6YrBkfsNBU35c+iRHrvf2qi+p9Ym7LWWDHJw
	mm10AtUnNAyMDiDh6vQEoRPVmST8QP/0=
X-Gm-Gg: AeBDies8SR54nSe7UZTATnmFhFJSFkBFms0Ezz/TrIRwOawByRLW9W2XjN0Vhl9d7it
	IYlY0a5ZzfBTPcRU4daYzc/r0ZIeDMAvlL3iDIgr1N27wC6+z7slWq/afXD4oZv9ExJ62VXWbNV
	HF6/vbLTgIq/QOP1zyGMJ8zs0SGSBs8Z9Q9y0OGr707OG8yaImIddFEFs7B6nSG/5RxGIrTiPHe
	9Pi1XF+Su/j1j5THUu+rlaLDKTreVTL7H9pS0gnGiV8Y7aTL5t61VTwWLhNRuIYflZMSquGKcwW
	fYBV/ZmFryyq+DW46Bt5Ag9i11oQj7DtMGHoMKhIicLlCTok7v812P2ABoAThOGLxLgpp0yKTZY
	Ml0661Yc=
X-Received: by 2002:a17:907:3e88:b0:b9c:b069:8abe with SMTP id
 a640c23a62f3a-b9d724d9f66mr684902166b.12.1776066093035; Mon, 13 Apr 2026
 00:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ziqbdajRR4fZ-_Ww25Td-vQI4lPfklpXD_pM87A2d1wMTKsMCgxh4hKyrZCFZSo8PXakp6_PYauSQWb3NUlsUnC-LCt6YeT_iIsD_M3GK3E=@innora.ai>
 <20260412000500.62475-1-feng@innora.ai> <CAHp75VeL8S-ymj6Q8wfFY7GZ7LWdP365b9fVUmzaxrze1oueeg@mail.gmail.com>
In-Reply-To: <CAHp75VeL8S-ymj6Q8wfFY7GZ7LWdP365b9fVUmzaxrze1oueeg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 13 Apr 2026 10:40:56 +0300
X-Gm-Features: AQROBzAssBCAZR7ObT4GPYG9JYV2qp4j3B1lmOBezwfucAin9tBA8WHXaKA-3Qk
Message-ID: <CAHp75VfFzq3UpLmc+gfvD=-65i3QL=D9EW5VMMKR+1U=E70-QA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: use array3_size() for
 overflow-safe allocation
To: Feng Ning <feng@innora.ai>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58633-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,innora.ai:email]
X-Rspamd-Queue-Id: B85623E85FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:35=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Apr 12, 2026 at 3:05=E2=80=AFAM Feng Ning <feng@innora.ai> wrote:

...

> Please, go further, id est
>
>                dvs_config->xcoords_y =3D kvmalloc_objs(sizeof(uint32_t),

It probably should be sizeof-less parameter, I haven't read the macro
definition carefully. Please, double check and use what it requires.

> array_size(width_y, height_y));


--=20
With Best Regards,
Andy Shevchenko

