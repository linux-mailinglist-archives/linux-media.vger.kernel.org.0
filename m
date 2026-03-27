Return-Path: <linux-media+bounces-57280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NvtH+uoxmk4NQUAu9opvQ
	(envelope-from <linux-media+bounces-57280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:57:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 255813470FA
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40F363053232
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D03C330D2F;
	Fri, 27 Mar 2026 15:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KSdhGtUj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4874782899
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627023; cv=pass; b=s3ufBxyMU7CRgzftMq7XPDNLShjA1s8Ggc6FryAk+eo7WkJHLB2LemLU3lYbBXL0nQnUI5+1DgMIaCUGL0xHIo9lHpwuWIoUtj0QJzfZu96qv7iQC1SdFe0DUIFF2fETVEhfYoGgio7IvZl0ED7Y9aIhhKRuHsvH13XTCfWHwY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627023; c=relaxed/simple;
	bh=uDkpvjfQc6WjtFvN7u3S6xqPAt97lXCMrejDxz+LKPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otgK+4Yj0q98+kxx5iOnQLeX01h14ZFUwJlJlz/PSvf1IkBp35O3/ZeMEATr5i4+57evfrFPqI7DtTSVS+zn7X+MVEziFzgevXXFLbaG82rI6meRH64SIAXW9J2dq8eCX8v5+2LCY713FtFtkl/mwekV2nTEZ9TYPGRjU/tyvUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KSdhGtUj; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so3001939e87.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774627020; cv=none;
        d=google.com; s=arc-20240605;
        b=Ei/J58cn8o6L38JXoAKUrRior7D/KOn5YBgjOtZpkp9vzzDd5yLWxfgj0lcdF4gYEs
         BhPfm9KV4nae7YePrla5hKNemflrWxtkJnh8TEfqsGALjmnHJ5Flh7vBbTSbhsWEXYvW
         jc/ZyZGG+n+2ZE6Yz5BYzCvbaPWT6vtK4oPne3Zhnv1BsjJEsklHXSwnEohW++1vYozn
         8mqahqXKxzAVL6ZqB6qP+N6z5meCtZvoRC1vcCMlD2TGteq9RGgFXD4pFusLihxlq2a0
         FbfIVRMyArf0dkjsGvbCOD7avyhDq8SSYpygaG5JXcSrWEbVPZ1wODvTpjuR7ir/AIsQ
         st9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cYmHFv0koBuOr22hHFFVxedqADAjwpKelTYgoI8eG1w=;
        fh=Y5UGMVIBH+XbVYU3jtl5vcX1b7P+PpTAPJG2wPoul8M=;
        b=SdNlHubkiD57TqziVxqpa+VIlfC7XlmdI5H34yWS7vR7Sh2ynHTiF34XkT6ZCEI4tV
         YiWSO3o1w3J1G/Wf31sWdsCFQWrAYwmICNqY6naQF5cgztfLYq+4j4+PM9n2XO9EQCGD
         pr0EYusY/k6kHgbiiNDgIJGUv/D2DcRVI7dlHEoLn8Cjaw+w9pqyyNPIgh85TJcnnADo
         S/dsRBTcTD1k11Ou8JImLb+4yfPwvkSfR0Tlg1NziAp0yac3hjxuFJwYFif8/t8HW9xE
         QZz8htdMFoQ9P16Xi1yATrxXKFhXeXEW0Nzhw3t1eDVA1yuySOaxj93YTQm29t1gL6Yl
         wzHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774627020; x=1775231820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYmHFv0koBuOr22hHFFVxedqADAjwpKelTYgoI8eG1w=;
        b=KSdhGtUjl9pjA707PXkQTidkv+p+qCYPdQobIGw4UvJ0gPFInC5huMi+hkG+3c/yjf
         DiarBEktdrgt7EfFHnSFSbNM6p7XxomBI7pk4fOo8cgkmU9EFrkTYdQEPCQd/w3KXSUl
         FZWj7aw5kBqu5ceylm8yaTCRkNJ/9WAwksRFeQRQesJbM3zk06KHskSdPLnncWLdoXGn
         cePQ8lnuMPiUeDXroM/h4uBpoDbd+9n7O/meqU2bFMWSWoPrwqPcXIVqrbQ+IYaAUPn4
         b0S+9GF832zvyG/uKtXpfyVbWE87PXxH/SQCKGowaoc36JjBaGgWj6HRvB6343VMA4Js
         TB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627020; x=1775231820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYmHFv0koBuOr22hHFFVxedqADAjwpKelTYgoI8eG1w=;
        b=IHxkU7SDbTO7h3c/FmtJfdqNAeF8Owwj0FDgMF5C50TV1FbqHjNSUncwBXsBFNSqzh
         lzIJ+n/ANfnlt6umujcnnJOxePSH/zTQqwAbbEWXQsoYMyZo1rs76NhPeEjetOBbc+dj
         v5zbMvh7m9Sv0I+wOG9y4evUU6SSmYlLAMUmmbnASF4RSuL7Yo/VyVn5oY4FAEvsA9lb
         HOumcTG0uV064fkRBfOs9q6wrZ/iZcpZss2DY526yySFcCumn4eLcHHSwuxczF5VZJZR
         1CBxSFKjZljsXmaIiPeD+AegoI0QhFdVzUM55JJgM1leMylxY+jHV6Om6bvrgy2EmipO
         wvHw==
X-Forwarded-Encrypted: i=1; AJvYcCUHl0wYfA2P/ftAmDqC9Js9hCHxWI+JeGbFxZfiI25442aC2ZGuUL1cQ/U1teUfHNZV91j8RDGwrc6s2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWmX6KewcJfSxDDUzr7jTfyRSUOefReS2/Zwf/Qn++cIgp7+td
	fOrgjbHZ4ACRUM2KqMYcx+KF2ilc8URY/9zQCh7nQMgfImHq5WUD1hd2zRjYogxisyAQhtECuLZ
	vc34YYFwmqbD2Zxz3D+Xk41xnr1hzl/7JPRfaQA6YQA==
X-Gm-Gg: ATEYQzzZWnYL7KEYLVZKCW5NdACY5WE82MAGrqJZwAJX8rCpp/dOcBwIxMdiK5+va7Z
	lrFrKnPUqeFXeA9SSaMz1/YFmei+w8JNvPKGXPIrq7xc7xEP3KoQoPcJEddGf/AewhlYdfwApu2
	wyVGfDpq2OE8AlWfbzWMP6gJyoZFndjq+i4hgilcWkRdEF+4kBMOtTvHUppXwGVgY0QSvo2EvFZ
	MkIEDQZkNjGxJjwicWTGkdPsz60Y6QdQkDLB3UQN+03C7l479a7uktv4rRYiUvltwxxsGTWDqM7
	xsO4yCDrR+6tCcWg/pI=
X-Received: by 2002:a05:6512:3b0b:b0:5a1:1885:69d7 with SMTP id
 2adb3069b0e04-5a2ab5fa3e9mr1072061e87.4.1774627020375; Fri, 27 Mar 2026
 08:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107141052.221108-1-marco.crivellari@suse.com>
In-Reply-To: <20251107141052.221108-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 27 Mar 2026 16:56:48 +0100
X-Gm-Features: AQROBzDDZ5QAg1lTfji5x_94JSZ9hGN79g1mn7PiEBPS-3IC_gLEbzraYL86wco
Message-ID: <CAAofZF5Ek3qL5bWq1-SgYG9c31=XKZ-NuPywqbCdnSKyxGMqsw@mail.gmail.com>
Subject: Re: [PATCH] media: ddbridge: add WQ_PERCPU to alloc_workqueue users
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com];
	TAGGED_FROM(0.00)[bounces-57280-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:dkim,suse.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 255813470FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Nov 7, 2025 at 3:11=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
>  drivers/media/pci/ddbridge/ddbridge-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi,

Gentle ping.

Thanks!


--=20

Marco Crivellari

L3 Support Engineer

