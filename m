Return-Path: <linux-media+bounces-54397-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNL3EeVKp2n2gQAAu9opvQ
	(envelope-from <linux-media+bounces-54397-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 21:56:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA91F705E
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 21:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37C4A30FCD10
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 20:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15B83876A8;
	Tue,  3 Mar 2026 20:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d+WG4euC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB437C91D
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571332; cv=pass; b=ROMBLBem5OFoSnWvlt/HYbDHgnu6MRFuarOQnRVNs+sNOL3sXmM/gp/JOoF/y4kxz37/RM6lvXTLeS6y/ddBlDiv4NcaijGf3bvpC4GgkXQfTrj0fzEVBiUJXdrX6HVoyUs8uQpV+48A/xcD+SWfY9gaPijA1MsDJUnq4gl4brI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571332; c=relaxed/simple;
	bh=QTcUFUPPKl9O5H+yEy/BveB8689m0SStI46+e//eW5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UkowcOsY7mV68xPO8v/i/snxL14zihxOo7sJWLWtjQfoI97rzK3W0WRRyBPtRtXkGi2c5cJInFxxDOcq04WTQfjcq0te0W6+DhpDJ5ENqOR2DtgO11ICXwF6IzpFEyKY8JJ54WcsK9SFH+2bg4v6b4Yl3rDrJBs/oG/193gTBWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d+WG4euC; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9373af81cdso876545966b.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 12:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772571329; cv=none;
        d=google.com; s=arc-20240605;
        b=HIjx2/AkGPrOCbCyZBeEYoeFiWKbemOnRdwFSMGh9uxEwiTiEdgU4dPrrXmWwK3fvx
         ZTGqOAEbk1jYcf8D759ds7sPlxv9yTSZj7MG8m672oFU5mVR3+3DkRa61bgyUsCinZpR
         kmrw/du7G0oCeEpPevvbrkBG6MJ+yTsGW3H5LGbFt/JcsWisCYT0a3cVc/Jk6+j57H7w
         Me47ESlW1Mw+pdVy1Wc5K3Dpkwk3nYT9BxstPlvq2llD5IPafJExMIiLUCTXry47cyOg
         qJxGiVDaNBx50CzGQnKjytnYiQud4l8ZGxKaxeBNxuswSTrjUeIN3lTquc5SvHlvpa1Q
         3/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QTcUFUPPKl9O5H+yEy/BveB8689m0SStI46+e//eW5M=;
        fh=ADGQQ7cSNAP4xl3mG1dul00+FjugWMv+ZHMQ6yJZSfw=;
        b=h4vPrX6zLAKSNBr2wCtsNUe/bhQG/saBuhAnJbQVtQQHoFTz3KU5XmBY2vszET0vQX
         2Ttvx+VwBkmNLt4K0eTMP8bbj5EtK6FmAK0OXqlsTNcySU2y9GItDmUaV9Sdnzu8fff6
         70Pg+EpEGxNiM5lhun/a2gbnFygzg1MMkKhzGJm5MwmOzz2740kY3b/0mNha9xHdNJ5r
         HpK/VhHUUzQlAfiSx4+veIHqWgneXardSZg/sr59Sv+EENvUemmsHEeG7p31Ibjzup6l
         BjA02FuDV1PBmxq9Hym2BMfuvTT0iZqJuvRh7CgAbhjpVQbCkDtgtWhtUP+qXgU4bopj
         Sr2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772571329; x=1773176129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTcUFUPPKl9O5H+yEy/BveB8689m0SStI46+e//eW5M=;
        b=d+WG4euC+4qh8SOUFghOC06vPh6fvFYtiD80J3/NAD4Pmh2RU0Jbpfsdn1o+MbOXl7
         j3nWKaNa2tcsEMPGB2g6WGn2H0hrSzB3JitSmiJNyIIVCjADmrb8EA7lAnyT7ERixuF9
         Sid/l/c/t98oWHMPLBPG67SDBUSi4vWsyw+5KqGuj3nSL1kwEFTfVcnnWlklrJf8yWTj
         b0R/mLjKjVqNAXC99+XaqkPJYg8co6Mv7l/kUwjbWs7tyn001RnckajOSmxtMtdanDpw
         vy8PMduXpDVeMnleRk3Ro0TarfbD0+FOaZEopjM7sbVWny/JAEEHeTsEwqqZ7opo4dBM
         0L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772571329; x=1773176129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTcUFUPPKl9O5H+yEy/BveB8689m0SStI46+e//eW5M=;
        b=t+++U9mGjpSQLLLO/LrHUq9oE/QSS8N6QcM4D3zSBitXiODyo8mbxpLDPdZDRDzAW0
         HwzlC2da7xqT3x8tGFPDjA4Fdee8UdLbN6bd1c/jbEQYjzU5EUP/y0QEsTxkKZJlGHwt
         FgKzhuk+zYa0hrZzLg9Wt8WUfnV8fpydWrGKdi1PUz0LPkVvV9gPL4SwxGBLmOT+ZrGL
         BV0RA867OH2RQyX1HAeuAD93meVJ52lppfIiCFa7dYbd2FCEaOdAlODb/zno7yI2A9IV
         zbvBC3hFU2+lTmw8c8lWeBi7UaWfG9o4lIGTLVIEV0hxFre8arw2T6xaBaHgXGovyjls
         u5NA==
X-Forwarded-Encrypted: i=1; AJvYcCXTkerq6KwzEpTqQsFpM6oHHorMXcz6jOlR9AMOdxcGXyr1NdNIaAujNCMY4X+U/tLt12pdW6dQGy5Uiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5zZ47cVFcjonxTTzaPBnUv/ERywSvyKyThE/IoisHdB1Vei8P
	6o9Sj3FPwvlRA32Hut1qbyBj5HPwTeD6qBJ5W7LVw9cLfiIKn3COhMUdiNzqQ+lDmGIWcQXTATU
	jdzLZzjl1wzAtj5VnJwWau6LLr9Hq3oPdadnstzs=
X-Gm-Gg: ATEYQzwhEtbxewa+TM868dpyvAySBD7CoHWq3ZqIzCWeuu8Xyj5/kBX314+2vIi7rVZ
	HiMlEwOoEy6JB/XNMgyyqT6Y62H6AJ5lPxJN7TZ/sBXBjgfPMhYRtreo0dVxr9NvcisC6UTDS0q
	tOTE40Q3eo9iCShufBJzeeuUgXpwfdVppxOZDwSmNmHHKC6h7P1c+LQ/YcQTX6oUKCE9+h1DlRf
	e4e+C0GZFNWSSFWV9jNwyQYkazfCD3OSFc8EqC+0rJansMEwBTOKrSw7YJUj04ULl2TXZVGSdvs
	zlJUmWVVd8CrpBQhRtrbNKiDrIt367Q9Rf4R
X-Received: by 2002:a17:907:3eaa:b0:b87:117f:b6f9 with SMTP id
 a640c23a62f3a-b937636cd7amr1077404066b.8.1772571329176; Tue, 03 Mar 2026
 12:55:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Mar 2026 12:55:17 -0800
X-Gm-Features: AaiRm50eZ6b1R9zR4BWk_SQv0E5klHORf7__0-5ZUwkb8RwaEPVqJM-v_erZHak
Message-ID: <CANDhNCrVVGsxEjgRcVJSn_E9WPUVY_9zpd+t0X_Jy7JqbcHDqA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] dma-buf: heaps: add coherent reserved-memory heap
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, echanude@redhat.com, mripard@redhat.com, 
	John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9DAA91F705E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54397-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 4:34=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:
>
> This patch introduces a new heap driver to expose DT non=E2=80=91reusable
> "shared-dma-pool" coherent regions as dma-buf heaps, so userspace can
> allocate buffers from each reserved, named region.

Just a nit here: Might be good to provide some higher level context as
to why this is wanted, and what it enables.

Also, "shared-dma-pool" is also used for CMA regions, so it might be
unclear initially how this is different from the CMA heap (you do
mention non-reusable, but that's a prettty subtle detail).

Might be good to add some of the rationale to the patch adding the
heap implementation as well so it makes it into the git history.

thanks
-john

