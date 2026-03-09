Return-Path: <linux-media+bounces-54974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCmfJiL6rmliLAIAu9opvQ
	(envelope-from <linux-media+bounces-54974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 17:49:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016B23D0FE
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 17:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4CDC312E7F9
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 16:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44863B5842;
	Mon,  9 Mar 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mi2LTGuB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A18F3BD629
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074490; cv=pass; b=hqLsSM+gasMKPep8/t7aRuqR2EK28LM2A26tVVeJmNgOHhsG/zLcQt1zLjx59sBPyt/CYz+9lWRL4AracxT1xtoBIxXPkz/RlOWqd3Hng5Pz7PAwPIXd/El91V9rWCFNd3S/9wtKfWWqCWVr2te0F8X0nKHFZ1e+pSWQRRmVvhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074490; c=relaxed/simple;
	bh=f2WhDJoUGRMLY0UAQRhBbyNRzq6qIYSfu1tWmaWc858=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=m5aKF0Bc7OBbqO9uxahhvY/hD4Oi8aflayRSjyKVxlafgI85Zclk3sTPDJ9ekyEBe84KMhvEOHX78xjj5FJ1fBn77BxEqV46kLoCae/3wi8HBbK+U/KPCeSTVV3jhFII1FBXgmi7XNkWuOOFMw0UNV+s+PkWGbP8YmN9tCltelA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi2LTGuB; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3597b474cbdso5106768a91.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 09:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773074488; cv=none;
        d=google.com; s=arc-20240605;
        b=DLh62bNy3i0SWYjs1zxS4uBZ+ej9V8yagdiD+ovCOrjbSW9B8+KgGLUBxaM/zYnC0u
         43ccy7yeXwFux8+9ZvYud2k87e7BvNlDKDmkqdzlS5zLl70lek51I6z0mXnzN7kh8W/7
         aD1cEvb5Bsa8agPLyCbqoc+Ozd/nNAkdh5gR/CAVYIK9Tuxw06uu/oV3gswGoMjkwTBa
         aYEH+hd1b0c9dZ9bBQrZpKwdGhTxsM81+DHO5ZGnzjSq3cmHvHBLnO1WUoc9MhiuBIS6
         PSSSg9/5DJUEK7EmmwPbuRpgstELGGSSq70VWXZykc9fEa0w03SNbtwCUC5Ay7A8+IeG
         p+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+q1JXLUy0Un6F2HdHE3FOsU3tROzzqf+uz6ZNF4NhoA=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=eb8v/IR+n7WbX2vJpz3AGPrV1TbN+wRDsXmXGpfe1zHdHPihqUgN+W/2Tw7JONV7YO
         tFt2Cu6g0klHOjyAlsRVSErFZToWjlqCrBwwZOjUXv1H1uuPBJcRV705YUHqW7LWdh7P
         CWpwd8z1XgXpwyAR+NdUpWmq8Gjh0YZCByEHhNHBrytBDUajt9mAccHN0SXpwdMIrKB/
         xKA7n8qwSohDRVvLTOgP338dxMPoKF7Af5q6XQdtrf6PEwCTM5wLIWHA9yTf9NAljCpQ
         HTefpOciTm0VpaUPSU0CxFccq7CQ6RVzv1YqmmQisfwM4zBp57wbk72TAVDHF0fxiv19
         88qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773074488; x=1773679288; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+q1JXLUy0Un6F2HdHE3FOsU3tROzzqf+uz6ZNF4NhoA=;
        b=mi2LTGuBMzv1KDlpZvIvPNdyC4ODI6rTUTlkqAFM0ygnrX8FVGFwFqT6IbNI2qRCSo
         Cqe74Kb0xFvQ47eEgZFLoZbWBE2AvpZ0NxumGq1Yk2h8CToCNKWBMPuGzB2gLzY0Ccb9
         PjRlu3yGX5pOIeuoP8mCKsyGSqbJH/Vyv2IGlcZl8+hRaWZsIv+30or4T7bkp7ptgF3j
         Qh6owblKFcIw0XHCarUYh+5qsjihgL3KxPfvmq5a6uLE1SOitHPb5ZBUhlqJWb6P28KA
         Ain5lk9jGs5IKJDE8sphI9VFYZrK7qRGMJfNhhYADnQ61aTvIgK8z1I1qcH66dXcooyN
         khSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074488; x=1773679288;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+q1JXLUy0Un6F2HdHE3FOsU3tROzzqf+uz6ZNF4NhoA=;
        b=HuyCTcMSdF1vCQvCVwltQas8bntbiiAKUt6MliuFHsz5pic6gHomvpVtE7qE+4zYSL
         uuh5XMH/527W0UuhDKmTnoN1TY7dgiuCNSRN7Uf3oTd9gEcXT5SGx8he1NaCFfmveMgD
         A94/F+7dMJnGza9ZW+h+rrgPAdH8XqHfkDKjMXi9luX0AQ/PN5L69pduvkGB3A+AC1NM
         NedgG+5RJi5TZpZcdSTkbq7JyR9n9K2s3NbXXq6ceTEXon4pPq+3UgZBCGmLTPTkTP36
         er5OSeX27/Bkrverd4SZncHA1qJv4n8agbK8t2l8gkbDqIh1igIeFpdj3M65BcWpJkZa
         b1SA==
X-Gm-Message-State: AOJu0YySE7sKmGucLanievBJrxSRES637iO9lqv1TM5X45jCUNIsg3XI
	9iSmP1dGroOWTMOn750XarZvkdtBZknuQYBi7GAbqP+ClXMU40JExJj+eHZU/a3neOXbO2XbpHJ
	WWME8Xe+GRzrZa3SA2r7GSYgYaX7t9ppYeYm7
X-Gm-Gg: ATEYQzx5eAxCUm+eFttKG0L1g9f0ZTMu0wZtEdyAOJo0tv+4DPCkSmQ02XfDIvs0MuV
	7LjcKf1LP1F2vzNYbRSesBy5GtiZ+ISitVPx+Qy1Wu+lPH7gpyUEgy3axzahIAN73eR9iYDdU8O
	W3ZDvSn38itWpEmLY7S/h3kit+5L6+17ldHCv5DduPHUhyqMf4F6sc6vfQdbZqb3DiB0pyqha6e
	uUGIT48oampsWb6LzZmMsOavxEJrofcLzAeTiGpxxEXSOv+oF3NrtJF/u3RvFc1o5HqvCNt0CW8
	w9wPPfFy1alZ2eRYWLoVN7qdkJfd5GqfLmttlL9GJ1gL1gKdOPIPjWzvFYj1fBVCtco9R3LR
X-Received: by 2002:a17:90b:180b:b0:353:49f2:1e7a with SMTP id
 98e67ed59e1d1-359be34982dmr11916088a91.17.1773074487996; Mon, 09 Mar 2026
 09:41:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228174458.11614-1-esty5664@gmail.com>
In-Reply-To: <20260228174458.11614-1-esty5664@gmail.com>
From: Esther Zilberberg <esty5664@gmail.com>
Date: Mon, 9 Mar 2026 18:41:16 +0200
X-Gm-Features: AaiRm53zYhCnqYmjrBnC5o8L6hYPVh4FGSyR0q57tt6FD8XHAyqrZy22ZjZPkKI
Message-ID: <CAPMPFbj=q+93yKr-1J=k+5Vxc8Ea_diNmCs80vo78d+1rcr1TA@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] v4l2-sysfs-path: add description
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0016B23D0FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54974-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esty5664@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,readme.md:url]
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 7:45=E2=80=AFPM Esther Zilberberg <esty5664@gmail.c=
om> wrote:
>
> Add a missing description for the v4l2-sysfs-path utility in README.md.
>
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> ---
>  README.md | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/README.md b/README.md
> index fe893b16..8420417c 100644
> --- a/README.md
> +++ b/README.md
> @@ -272,7 +272,8 @@ Installed under `<prefix>/sbin`.
>
>  ### v4l2-sysfs-path
>
> -*FIXME* add description.
> +Tool to show relationships between V4L2 video devices and other related =
devices
> +belonging to the same physical device by parsing the sysfs tree.
>
>  Installed under `<prefix>/bin`.
>
> --
> 2.43.0
>

Hi,

Gentle reminder to review the patch below.

Thanks,
Esther

