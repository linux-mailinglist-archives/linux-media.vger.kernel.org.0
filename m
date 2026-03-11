Return-Path: <linux-media+bounces-55360-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCoQI2A1sWm0rwIAu9opvQ
	(envelope-from <linux-media+bounces-55360-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:26:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E12606F0
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED5E9302A56C
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF063D16FE;
	Wed, 11 Mar 2026 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjuLlPxi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA743D093E
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220810; cv=none; b=CTokss56JD4+z0Ho8naG48zg30CfYwZeZ5dIMqqml/YgvIhF2zWz/M24m4ye0N5y0PycpZ5j17hDk1fQozsUeQec7LyAET3AHivjOnW6fzrf2aoTpqp+Af+2aHh72yM+6lqnskr+WJKXFLz2ZiQ/cUPYUosZZpz86u163fi+vNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220810; c=relaxed/simple;
	bh=kQUpjUR1n67t+7g7ZLfLOltzpZ8QpKa8rbwtn9vpasU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwFDUjZpQ5gUhHQXIoc1P6PiPLAXMbb6PQnZWTrdWwHk2LOB9Se3WFr3O1BKGWcm7Gtxw6WskB0LsN2CyWe9ZA/OD3N1xKkxmXpUgkg7SRdUxtxoVEKOEyeJrC54fvN3Wqh1U5QH5Fa1vi3mGXIij9CuakeAOInpK5BJYo3Uy9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjuLlPxi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFC1C2BCB2
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773220810;
	bh=kQUpjUR1n67t+7g7ZLfLOltzpZ8QpKa8rbwtn9vpasU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MjuLlPxijresEdKnh6HEHH/prabl5PVYiqiuSkHo2NWMX+VgVq4YyLierFWtoveew
	 OzqcCJSl3GydvphlLqwBF8ekRS9hP8Mc8hB6u13fr/tyUK+IGioT39WObKe6KsBWdT
	 VqSE1GfyINqhluShWOQnO6nqzswAke79rnLUKegRfg5uPQO78WNLOY3CfnGmfmdm5V
	 belts+PSMz0Mjt31nfrHf1CQWMNXJ/CN9h0HGpEqiNfSXwOpySSpSU+unGfF7OzdCA
	 6QAYYn3C8vGFK2j8Bh2xZ2pi3ffYzQvpdBb83zzp3nt4jy/hsrAVqbuVVh0Yyw8Gg2
	 KCe32fZg0DkSw==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9ebd1369so12914054d50.1
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 02:20:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YzHnPAXPFHUzcbnq2ySI1B2DlPLZl5Bocg1nIv4ljKGErJZXErV
	unRUV66FUWCZJ9N5vnEJgMsTXhAi/PA/kboE4iMp4hTaHiEXUOkJF+6s2lNtB1Le/f3j0Wwystv
	Zb9/GzjCIVJfgyyhlNXUX9lSW+wEJpl8=
X-Received: by 2002:a05:690c:81:b0:798:7861:5069 with SMTP id
 00721157ae682-79917e8035fmr16236127b3.9.1773220809439; Wed, 11 Mar 2026
 02:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
In-Reply-To: <20260310-cma-heap-clear-pages-v2-0-ecbbed3d7e6d@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:19:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLmNfWMHEcyxEzfcE6WnE1ajSLCWRDzYZa-Ws_6p6QPD2w@mail.gmail.com>
X-Gm-Features: AaiRm53rJjiRo-FnJSdIEmr-EESY7pcgybbaQZQRXtctwVYmjvpDAq6jHJc9c80
Message-ID: <CAD++jLmNfWMHEcyxEzfcE6WnE1ajSLCWRDzYZa-Ws_6p6QPD2w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dma-buf: heaps: Use page clearing helpers
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 087E12606F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55360-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 9:53=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:

> Use clear_pages() and clear_highpage() properly in the
> DMA heap allocator.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Patches pushed to drm-misc-next!

Yours,
Linus Walleij

