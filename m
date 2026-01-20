Return-Path: <linux-media+bounces-51122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDevBeZUcGlvXQAAu9opvQ
	(envelope-from <linux-media+bounces-51122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 05:24:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C795A50FC6
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 05:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 374E45ACF50
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14033BF2E9;
	Tue, 20 Jan 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIpDO1pr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DB3C00B0
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913220; cv=pass; b=mVXGz/GSqt1qChKxg+pgJArbDVFvpmb7PHm790Xv5oSxog6V77z2o2EF2TaViewSB/PwAt3woczy6RwrOPiOD73O7BjorOJoA9WNl+dY0erolNe8qw45GMFHVivs/PCldZQisxgBIin7DWHPir4ItnHLE6W2kkPxmEOzaJe3br4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913220; c=relaxed/simple;
	bh=rQrD+V1Y+in1alLViW1NLHP+ces+ltnLdTUx9NLPHmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDU6hmmfjVbnaE+ZLWY1mwVfoLIvjrouAuRN0StHFo159NuYkAUENo6/UAtOIDSfhIZGgUf1I6ZOVq0P4xMUUecyc2GHxNU8hMX7ZMZJD3oh2JAOkWOPKW81f8tApoK3N0TBuqO6Q1V9hGq8tBdQSrV2AwDI3a/iCAI0CnTsfgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIpDO1pr; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7cfdf0c8908so2527170a34.0
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 04:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768913217; cv=none;
        d=google.com; s=arc-20240605;
        b=ZErgi9h74YFIaq2ui0cdLjQD5KSzhrZPKRJkCorbNlXmQkLkPK+gaTZ2oizmmk7xlF
         aOlOmz0R0DYDil13Vt4LzZyVChDaOPPn4sFfiP+Ap6HxFxgr2jXAGnsSJ6/BvE5cuCMv
         HJsVZBTbrtywmge1tDtNZdMMzlUwL7tF9AFHk946jxZXcQIivVKoDeQbIhjGEPdlnyMb
         kosxJSu3bpBWCvHHyaqXey42v2FZMP7FWL9VOAYT/dIx8S1bK0xsXD6cZuQYDANbzA4p
         5JIdjmvd/J2kcPucy8rRNVeTfNQNXfpsjDIDHP2Q26HdBVK+hhq/qVadUWIJ0rJZVSs7
         Kq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rQrD+V1Y+in1alLViW1NLHP+ces+ltnLdTUx9NLPHmI=;
        fh=PystTzM9is0M1X1I1NwzfkLP6f8izMfa31VrPeQCp9g=;
        b=Qzy7GAD0xryUxW80drVHT3YXWIricBxBpdt0erytGpINqMXVoqBPH9qqwKk9l3aEEW
         kcBIpICmBoYT13Pqf3gnnQV+srKfrNX7ojmFT4FxumOQoW+8DZL+zl5/sLNnJVvtmgaX
         5jTEzkae4whTX18AG2BFALK7QGEZPzWS4uNqElQ9/33VPpB7rb9kQy/cN4+BWDKpZAFj
         3A17xl1Fb+iAG65WwDPvIzUSWhIwcoQtewDMyKOlqYvRySxA512fTg5Mq5o3B3dTgJpk
         bV1ICv/qos7nkVe9w7G0Bn/BmogMEsVTC3FGrfn6WKjyBdpz8kiBP2CpMPckoazWM0Oe
         ceAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913217; x=1769518017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQrD+V1Y+in1alLViW1NLHP+ces+ltnLdTUx9NLPHmI=;
        b=RIpDO1pr937+m1F9qiRGKDjEuzei/A17XH9zs8moYTDr+AWQfEqMPVNmjiFA1VRFy0
         tB8YoNLIWXmx78ol2Fn67xoyOBUW1QKBLzxyWgBhknjaZ/Sr1nCsPvIVPA24PXt8Tn8l
         k8fzqoO6h89Jfq8P1vAVjiKw1+v7dfBNnWJhsxr5AcqC5M0joNRtORRTJKrCRQI3qzhY
         ESQl4FumAwZLUlGV/ar/p1K62StE/6C/LLER3ATmU+LFhVNBaDogMd+GrCdkpVvEw7sA
         77jamSaxfiRa2kDd9FwBNfLr2kqcHmMWrEWOMiFs5AwmLPDcxmMrIK+LNYO5gQVdxmQc
         K6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913217; x=1769518017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQrD+V1Y+in1alLViW1NLHP+ces+ltnLdTUx9NLPHmI=;
        b=o1f6HA0ZTGvyaKBsu6zaDdpxBzTj9ZZ9PJtf6TPkD+UeafnphT95VIiNU6nd3ngNEu
         scLWOuPtkiJsQBhp9mx2Zc8CFYDXoifGN9U7Q4a8b4QG63VvxS2nKqjTud56Qnk16nCS
         62VoKMnfnXz1qtYOff7yOeANxi1kBxtoLYICuDwtX4eYEigVe51jwROByQiwcEiuC3gv
         /BmSjMO+c1Ii6jrKdtJOWxSIKlnOWRU8GyhbGrjda+mut6kaXjIOrim/OGn0KNGRPK14
         yJZClsYXImD9DFvtTBu1iFl+DNuLghwIVbyMTdNobDc925wIJa49bZECyfzdxMS0fdoI
         8NCg==
X-Gm-Message-State: AOJu0YwSFQQwIotE2iIhWCZgckFfzREx+XoprG47r3/ENJKbvKkcsLIw
	/ndWAnD7ye3m/qCJRFvzNtSN40ufHK0c/ZM4agDi1DGK/IFt4wiODjwmf/czdrQ8i3eHITooUu0
	xjd8nysvwl4f6tzSdN/B5BOd6ENZ1S38=
X-Gm-Gg: AY/fxX7D5D7y2ym0Eb5bAksU/dawjppxFVkr2dMvipOeep+hN4vYra6JeRJ9WsKnDB4
	kNTkDhapiTk3b/+vZ/g8281uPstWQq7X+/J5s9iHauJULAxwXtsi8G8VRUpYgeN0eXD5ogzLA10
	kfYSz5QHbwer6LlqIlfkyRN2kHQzGlCZPRvSLdwsQYm8A5ZGLu7iepuSiZ7MKYiWUSWusCXTwvU
	+qSCUHTT/pzBYX4OxyyZ7S2QkGrOdQPE1hr8BVUo23jNNVhH/61GmNkhJC/oTVQ/RgYlHOrijON
	fwq/SbVYZ6BiG+T9o7nVG0gPyhoPSkmY42MrH+R/mQ2vbPhMCtfsgGqAzKCKFA==
X-Received: by 2002:a05:6830:380d:b0:7cf:dc0c:8cf6 with SMTP id
 46e09a7af769-7cfded1e4f5mr9674488a34.8.1768913217232; Tue, 20 Jan 2026
 04:46:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120121105.8959-1-hanguidong02@gmail.com> <88dbfb85-571a-4f65-8879-16972dd87bbd@web.de>
In-Reply-To: <88dbfb85-571a-4f65-8879-16972dd87bbd@web.de>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 20 Jan 2026 20:46:46 +0800
X-Gm-Features: AZwV_QhRCRUwlJkWsKCItRp2IeRZVqpE0H4RsHQpr9Q6txnacLb4VQKU95lDNoY
Message-ID: <CALbr=LacbaugBceAEf65uT9xhQsxF99zo4jXqNUELqb=2t_9cg@mail.gmail.com>
Subject: Re: [PATCH v2] media: dvb_demux: fix potential TOCTOU race conditions
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51122-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C795A50FC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 8:38=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > Fix this by extending the lock scope.
> =E2=80=A6
>
> How do you think about to increase the application of scope-based resourc=
e management?
> https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/mutex.h#L=
253

I did not use scope-based resource management because it was
introduced into the kernel relatively recently. Since this patch fixes
a bug that has existed for a long time and needs to be backported to
older stable kernels, using standard mutex locking ensures better
compatibility and easier backporting.

> > This possible bug was found by our experimental static analysis tool,
> > which analyzes lock usage to detect TOCTOU issues.
>
> * Do you refer to any other source code analysis approach than LR-Miner?
>
> * Will any additional background information become more helpful here?

This is a new experimental static analysis tool we are developing.
There is no additional background information to share at this moment.

Thanks.

