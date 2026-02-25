Return-Path: <linux-media+bounces-53417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJaMB+BTn2nXaAQAu9opvQ
	(envelope-from <linux-media+bounces-53417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:56:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9479019CFB5
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E10E304FA5F
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E302EB862;
	Wed, 25 Feb 2026 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4qVzHFrM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC526E6F4
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049368; cv=pass; b=ow+A0fldWPr6p1Wf5V5QZ3f7bLAVojDDmXxEZ9HkBat6eK5PWJ2FcvUdJo307On+CKtp6gJmMk7oPm3SVUIChACzo3+alYj64vIwBkVnDSiPZHrkU+zm7VNS3dergIv5//Ydy0Q1JFHqYApmPbaOZhG7LVH0h9QGwKnm/T2+STQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049368; c=relaxed/simple;
	bh=HRL6lEk8UXTpub6PekQgYs2cjNTKn63oRhQdj5ExDbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USy1TQeRrAiTTGLWXNK2yS7IRApqJMau+Qw+4nv3eL6OT+W8B39JCRVaVvdO9r9vvT0WkDw+aTGH26ZxmQkg4cFqtpUZTTBfAqxJXiAOgQUG8seLDCwXI93pwz8SL/KC8iPca6nuh3/8KOJsroXWp96y//+dUZI0QOx1MwxgVLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4qVzHFrM; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so14725e9.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049365; cv=none;
        d=google.com; s=arc-20240605;
        b=WXufCsgW9ryf6vRH+rmmcZX2EBoKtYv0s+W8PCqUgY/1/adxUwRm9rihmZcbt3EzmA
         07GljkgtLfTh0O7eiMkX5sHYq7m63yHvs0anxeI3BtPt9gycoO3ZtqikWZOAJSMAYKCM
         lITW303kmMCOw82Sn1kH6OVQGOWhRYSPyd+MQ4twTqoML7w5KVgAEktmdorhI/lV5Lh4
         6MT36hQgAr5pa/Ft5axSA2kJ+wi0kOFHWu6cm3qNfPgvXfeja7R2+0B+aQyPLU+SG3+a
         2TSRFyOf8gY729Z0k81TZNnHb26Kvy30yImP3HdqK/Szezy24dK06+yzMMdpLxy+v1jx
         4IeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRL6lEk8UXTpub6PekQgYs2cjNTKn63oRhQdj5ExDbk=;
        fh=5Rno6sjHoSGSeK8bidrIPpdlZH06JJlruMAy5YSeho4=;
        b=Hzis/pxl36NEZEiYcSuAQtbDkNgh+bzroW6zYUHj64cZ6+tM5jGOzZgXHlOSHed8+J
         hdx/6jnbQF+RI5oldE3SN4IvOcnXVEAkZPfiibK6YemlKpz62CXCTgLjsplTr/yG1u0O
         6EW1RpS+nhd9e51cJjfm0xWtZX9kCGA7x0/JRh2w43AJ76lbvkEEIaiZRdHs+VdD1/VK
         4W1Qrv4cYFCUTDqWQ1TtWSrMmfvAu6CQdPmDDh+NzBfeKBRXK7nTcIuYCH8p6U87poEs
         MqksCQ+UjCfz897otRrzzdqnWtKV3e0rDoDOmDGc/GMrxTAkCiqFXxba3Ftb2l52UlUk
         arpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772049365; x=1772654165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRL6lEk8UXTpub6PekQgYs2cjNTKn63oRhQdj5ExDbk=;
        b=4qVzHFrMuB6Qvj5n8qtwh5zuEMXlDsGW+hWkjq+ixxTSCgGL5q7nbxkj5Zv/uS6pbx
         fafVKna2/nS0HbeRVh5SnUoTVAImX+LkLs3INvgg+UUBSRA1pd7V1Wj7hC8bA7upFlx/
         MDAZ/wPuZGehum1iS0epIZ/6JF6GeR/quv/xiP1oP5pYnZS0Po1iU7j1NH1PgnuOyXBD
         WdbKPyGy/NhFvihO5WTplQBNtvV1unrYViUAwJKsTtVyNXBGNvnuDl2dwvcBpDrntr1y
         zOWMmSo2CvdaKp7A9o9mrNLKtyFEIwkhivAtYtj8Ni2RWBc5CpRiQjyqifGQ8Xx+J5Me
         HSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772049365; x=1772654165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRL6lEk8UXTpub6PekQgYs2cjNTKn63oRhQdj5ExDbk=;
        b=v9V9Rhe1PgFi4qs1p0FwbhHzfcvKYdAqSONinVEM6RTA+fUEtPQ5awAZsLSTsf8c5S
         7eHrFQBOXb+a/xqNMA5LZ1fCYFBgynwdAKFNSOlVmZHgLTNcLAM9136oUqs3BdRPj3D6
         iLypFZvxR4zurA6vYllVmXpmerI8R2vAJ2tQrdBXap7YTxjVrZ3obakiVleUjPAthffW
         gvjAr3/l958am7hEhR1Chl9gwPSRZSEbn1VqjuTOqzqFsbbnGQgnQcHh4f5HY2pxnak2
         GzMlKKkoffh7IrSXbtZUlCZ+jcMs/Lys4KXqlCnh4Sfxw/bcNMKuVbKPWL/t8h2gPNUW
         Y//w==
X-Forwarded-Encrypted: i=1; AJvYcCUlnlClQCTSMvYfNY838yRFq3h6BCuorccgOOMEbbjA9oFKNUMnD+U9pDtzd5IuugXK5gtUEX672PV5DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJ+zDAG49EjPk6AtG5tjQhVvUk1fGFZuSRbdntkqo5AP2WocD
	dYn5KyAOw90FR/5yL3KIiDeg+g/XHTkucCl+mzDGVK8ZcRnJZBUS6oNH2WfWr5NuEjsstcK72z/
	5rdLJwG077rnbUpdrr6/DvF0adAYrcZReQRx2Dm8C
X-Gm-Gg: ATEYQzypPEMtAqprYfXJzAWv/0nmGaudtOQIEMYJaLzeu5o6J+uphXyrMwWFFjvR3KM
	4X4O7Ss4VsYiHdv6KItDx9gHJn12/4fmuaF4nsQLoaCCs5Bdh5Tuo7C4R+KRPuM/kE4qZmExpb/
	/h1AALLtuVMXg8sLWXZhVaAjH2SO/5p1jK3VA2aDjEZp/aVw2IpJE1181MuKSulp/vhfbNJd8zV
	I6p234y36uceNPOsl4yydLD9/OicJbnTdS1XD9qXaplTYct5cWfwJA32BVCS96yv/5kT3TnZcwZ
	PjMDik6yDJ5X71ZEcXr3yUje4fGUuIKBieL9BGwbAwYJoxFWfDC0u4Yz1f1axJMTzptw0g==
X-Received: by 2002:a05:600c:6a8f:b0:477:c5b3:7a9b with SMTP id
 5b1f17b1804b1-483c3188d68mr92305e9.10.1772049365087; Wed, 25 Feb 2026
 11:56:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org> <20260225-dma-buf-heaps-as-modules-v1-7-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-7-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:55:53 -0800
X-Gm-Features: AaiRm50aJvmG-U5wbOHTqLRYSqzdYRLj0K9YYWnCflGgDx3T0BxE0_R2bnIQaGw
Message-ID: <CABdmKX12GL7gd_TMArPbjGwSOOhu+udFHZ61dDfMwWf3q6cB+w@mail.gmail.com>
Subject: Re: [PATCH 7/7] dma-buf: heaps: system: Turn the heap into a module
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53417-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9479019CFB5
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The system heap can be easily turned into a module by adding the usual
> MODULE_* macros, importing the proper namespaces and changing the
> Kconfig symbol to a tristate.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Same comment about a note about the module being permanent.

Reviewed-by: T.J. Mercier <tjmercier@google.com>

