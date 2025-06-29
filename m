Return-Path: <linux-media+bounces-36162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9A4AECCC5
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 15:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 915793A3DE0
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 13:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FC322126A;
	Sun, 29 Jun 2025 13:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJSSuGD/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525B1A073F;
	Sun, 29 Jun 2025 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202177; cv=none; b=KtRSuuysft3B6fBs3N7WT25sxPnHMA9a9IZvdoXI2X2WIvqvcb2B4BgW1SKhUi8q4CK/DVJbed0NgECd3dM982G3RnScQq/0GAe02TCafBp27n6jiphi3o0NRYulZLV3bs9FSre1dHZ8cjOjvMecRvWBaNK+MxAiTfqQCTkUXHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202177; c=relaxed/simple;
	bh=EN2oU54wCuY6GsIt+QUyhoBSYS3VXx7KiRPLz6ra8WY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwDWEeb1/88xYnlZDtUzYosDLMkTwcaZLTQaRvpjAuQn5Py1ktfn5ZWhkZG+LyE+GUr/6Ih8890qaJZDehhWpa6VBGva8yfRrz8LR8nIvQkK0NobCXLjlPRYItdHvo6O7YDwXSCqvXxRDCi9EVJgTLjXzqKuA/YaFy47upDTxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJSSuGD/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so496750266b.2;
        Sun, 29 Jun 2025 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202175; x=1751806975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+hIABstLuKTp9oXVilxpuDSR3H6aMNlaV7ZQqsdujA=;
        b=cJSSuGD/WxC4Dfq2AW2+nFOAXM4owrblKA/yDwRS/UeFGSZh3PIURYWS1M98Uv2p+v
         RcleLedynme4r+IFFFM2S0bhUEhVneMdPawS2It6ffLHZDkRvMNBkGDIoQ98B8eJyeen
         P2izikK5THlwuB1uER/K0m7/0hfSJcf6Uaw8C6pfJPhkvvj8fvsRUKoHt7BBl7acOCzf
         hfodqMxfH+WJ+KBWyht0x+5ogxs0rVMtO1WC+oKMUAFLi4FDHeMyJ6toyWiWhZSkp60V
         uUCx1Ua1/HhfGd5AlkDtbpnBL6zt4OEeYBBT+WKnlyWvatZS0dT/k9/EeXYHQJk1yHOv
         ZGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202175; x=1751806975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+hIABstLuKTp9oXVilxpuDSR3H6aMNlaV7ZQqsdujA=;
        b=u0K6s49VStdPnCTDHuE1qyffxWZaACAEqn+zI1JLExaFIqz6KQqzpIvJSOKOtgHkO9
         CM0GI0YVkejkN8RedRYrxXRv/YWceAKQxz6Op0NUsR7S+GZinykBuaiZCsZEHSLeoU9u
         pUBCKniGa7/4ti5olJkvaoFUA93sJB9PJYr9h9d5KdJU367VjGOJ2vVqomcYW1OY40Od
         I9AU76yFZio50vFpgfnolWu32njcwi0XIjprEYz7DQW6JBt7ZBbpav3VUkvf6vs9H4j4
         X24jpTl9AeipTOmkdfU1RagihFxxUna6imirSJaEJyt138NVL2Npurmjg6meRt+O4lrB
         qN/A==
X-Forwarded-Encrypted: i=1; AJvYcCUJusoat70H09sk/0JazNR0zyNt5mn05sMa6uDZX6ShIc0krZsv9xCdETiJKKWh1v20jNu2BaJ5IM5ddeY=@vger.kernel.org, AJvYcCVfMn0s+1FfVQyjaEAYWnkAYNaZRZeWfszx6MJ35zfXyF8VLpLFnAX01CRRVUcbs/6aUGIybGge/8GVNV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKiek2k5ysrj5ag9shv/Pa3oW3+GBdkaJ/fdWhFtWzcirRJ5nP
	MBYwqSyAEe8PnRuFpNhYyy7EIEBOi0/1oJFZt3zG2qYV57OyuTr437kfGEwgfcsdvybq1pZTZ/9
	sBuQe3RxKgILEPoqUPHsxoamtPgdWKLo=
X-Gm-Gg: ASbGncuuYd5el8JrlGNPRJQ8BbODtgoHYGQp86Z3KkMJaWyMv2FLLA2QFY/O2EocGDt
	0iHyIB/5jR7LGJVFt7ASkQuRldmSO90O/YDFuM3tpVpEUWnAdhjsWI//9TBqyMnylOADTxrqUiU
	x8G7ZhMW9H+YTJ5bIowcBMTTb+Gc4ga9/ppNo06GL79TKZHA==
X-Google-Smtp-Source: AGHT+IGzZG4m5nJ3cy5A11fgQDvb/6qdsnq3/N/EpJ7AuV9uPHGOL2LH30aCHfszUuoqP2ekNSLpiYymPI3meDmevVM=
X-Received: by 2002:a17:907:1c18:b0:ae0:4410:47e3 with SMTP id
 a640c23a62f3a-ae3501a58a6mr976502466b.51.1751202174144; Sun, 29 Jun 2025
 06:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
In-Reply-To: <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
From: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Date: Sun, 29 Jun 2025 21:02:42 +0800
X-Gm-Features: Ac12FXy0BPQrTL73ahcA03QPM2uG87FF952R6L-TNLWLb0-NWWIF7eGtGwehXio
Message-ID: <CAKEtaPAr6g5bGFwPJZXRHN6p9u5SrUo3kQi6Zcpp7hbFCp-J2A@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Hans and Andy,

Thanks for the feedback. I'll wait for Andy's opinion on this before
taking further actions.

Meanwhile, I understand Hans' concerns about clang-format changes and
I can prepare manual cleanup patches as suggested if needed.

Best regards,

LiangCheng Wang

Hans de Goede <hansg@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8829=E6=97=
=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=888:20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 29-Jun-25 1:30 PM, LiangCheng Wang wrote:
> > This series applies clang-format and fixes all checkpatch.pl-reported E=
RRORs in the AtomISP driver, excluding the i2c directory as advised by main=
tainers.
> >
> > The changes include:
> > - Applying clang-format (excluding drivers/staging/media/i2c)
> > - Removing unnecessary parentheses in return statements
> > - Removing unnecessary zero-initialized globals
> > - Fixing space issues after unary minus operators
> > - Wrapping complex macro values in parentheses
> > - These patches focus solely on mechanical style cleanups with no funct=
ional changes.
> > - WARNINGs reported by checkpatch.pl were intentionally left for future=
 work to keep each patch clear and manageable.
> >
> > The full series and corresponding commits are also available in my publ=
ic Git repository:
> >
> > https://github.com/lc-wang/linux/tree/b4/atomisp
> >
> > To: Hans de Goede <hansg@kernel.org>
> > To: Mauro Carvalho Chehab <mchehab@kernel.org>
> > To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > To: Andy Shevchenko <andy@kernel.org>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > To: Nathan Chancellor <nathan@kernel.org>
> > To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> > To: Bill Wendling <morbo@google.com>
> > To: Justin Stitt <justinstitt@google.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-staging@lists.linux.dev
> > Cc: llvm@lists.linux.dev
> > ---
> > Changes in v7:
> > - Split previous monolithic patch into multiple smaller patches
> > - Applied clang-format to entire driver excluding i2c directory
>
> I took a quick look at just the clang-format patch and looking
> at the bits of the diff which were not collapsed by github because
> the changes are too big, it looks like the changes which clang-format
> makes are useless and often make things worse, e.g. just looking
> at the first diff which github shows for:
>
> https://github.com/lc-wang/linux/commit/8a3bbdba275e42dfcb0af2ddcc2f27463=
bb316d2
>
> which is for drivers/staging/media/atomisp/include/hmm/hmm.h
> then all of the changes are undesirable and unneeded.
>
> so the running of clang-format just seems to make things worse.
>
> I appreciate coding-style cleanups outside of the i2c dir,
> but it looks like you need to do everything manually since
> clang-format is just making a mess of things.
>
> Also if you do manual code-style cleanups please do one
> type of cleanup per patches, e.g. only fix indentation
> using spaces instead of tabs and do so on groups of say
> 10 files at a time to keep things reviewable.
>
> Regards,
>
> Hans
>
>
>
> > - Fixed checkpatch.pl-reported ERRORs (parentheses in macros, unnecessa=
ry return parentheses, zero-initialized globals, spaces after unary minus)
> > - Left WARNINGS untouched for future cleanup
> > - No functional logic changes
> > - Link to v6: https://lore.kernel.org/r/20250627-bar-v6-1-b22b5ea3ced0@=
gmail.com
> >
> > Changes in v6:
> > - Applied clang-format across the entire AtomISP driver
> > - Fixed all checkpatch.pl-reported ERRORs
> > - Added explanation of tooling and scope
> > - No functional logic modified
> > - Moved 'Suggested-by' and 'Link' tags above Signed-off-by
> > - Link to v5: https://lore.kernel.org/r/20250625-bar-v5-1-db960608b607@=
gmail.com
> >
> > Changes in v5:
> > - Replaced space-based indentation with tabs in output_1.0 directory
> > - Used checkpatch.pl and grep to identify formatting issues
> > - No functional changes made
> > - This patch is now focused solely on tab/space issues
> > - Link to v4: https://lore.kernel.org/r/20250624-bar-v4-1-9f9f9ae9f868@=
gmail.com
> >
> > Changes in v4:
> > - Moved assignment operator '=3D' to the same line for static struct de=
finitions
> > - Remove unnecessary line breaks in function definitions
> > - Update commit message to reflect all the coding style fixes
> > - Link to v3: https://lore.kernel.org/r/20250622-bar-v3-1-4cc91ef01c3a@=
gmail.com
> >
> > Changes in v3:
> > - Removed extra spaces between type and asterisk (e.g., `*to`) in funct=
ion
> >   declarations, as pointed out by Andy Shevchenko
> > - Update commit message to reflect all the coding style fixes
> > - Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@=
gmail.com
> >
> > Changes in v2:
> > - Fix patch subject prefix to "staging: media: atomisp:" to comply with=
 media CI style.
> > - No other functional changes.
> >
> > Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gm=
ail.com
> >
> > --- b4-submit-tracking ---
> > # This section is used internally by b4 prep for tracking purposes.
> > {
> >   "series": {
> >     "revision": 7,
> >     "change-id": "20250621-bar-573b8b40fb80",
> >     "prefixes": [],
> >     "history": {
> >       "v1": [
> >         "20250621-bar-v1-1-5a3e7004462c@gmail.com"
> >       ],
> >       "v2": [
> >         "20250621-bar-v2-1-4e6cfc779614@gmail.com"
> >       ],
> >       "v3": [
> >         "20250622-bar-v3-1-4cc91ef01c3a@gmail.com"
> >       ],
> >       "v4": [
> >         "20250624-bar-v4-1-9f9f9ae9f868@gmail.com"
> >       ],
> >       "v5": [
> >         "20250625-bar-v5-1-db960608b607@gmail.com"
> >       ],
> >       "v6": [
> >         "20250627-bar-v6-1-b22b5ea3ced0@gmail.com"
> >       ]
> >     }
> >   }
> > }
>

