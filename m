Return-Path: <linux-media+bounces-63730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iUOoAPbuIGq39gAAu9opvQ
	(envelope-from <linux-media+bounces-63730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 05:20:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FBB63CADF
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 05:20:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="JRk/J+zx";
	dkim=pass header.d=redhat.com header.s=google header.b=prPE2yxc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63730-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63730-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC59D3043537
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 03:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8EA3AEF47;
	Thu,  4 Jun 2026 03:19:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860B3AEF3F
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 03:19:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780543169; cv=pass; b=h7851MtTPsMNyMh7/dCYjEC32PiQ+3K1V+WDjZ+MKMv3k68ckhZwTUFI/7902mlGm+Vb1NDSu4zwXgozy3J25NS/QJa1mhoYHqkcFXjG+XwfShjWWzZC/UfUzg+ISakqKWQq7YnDrq0mjOMaUwV7I5Tl6nRXsyTWc/JcYMKcY8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780543169; c=relaxed/simple;
	bh=0TWde3lyVtITMZcIphtbutN2I/IrIOqFu9GwaO73zJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnsmoxqN7/W6VGIF2urINJwv7Uq4UHCCcqbSp3QPp00AXfhZ+3aFsIW35/yrrALt3n4CJ6y9d/StzdoWIbYR+EoLOlvyl0eCCI7eiZGDRLuiHrJl8E/EHkMpLYp5W+r+KUCEFvehhmJKtPl3ZhsNZ0Mn4YZ/ez5B3C5wcMuKxKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JRk/J+zx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=prPE2yxc; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780543166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FtQEt05HmbWhksD/Qfnja1wIBfLl3h9z1JVOcJ/YiEA=;
	b=JRk/J+zxL7XWSxiiILHQ1Q8z73DLtYszxIQ7DDhhLWtOSh8zRmhq0b/JMpRLY00+03aogF
	AJzldz9MfB8TaJiKvLDNwjVMxvKawX9RTfERSJRV3bnW9Suwd1qZIlqDe58V90dnCaTp6P
	Q078XOtJ/fJwZwX9zmvUeT1rQlGfSS0=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-7rvMhNznM3Oloj3m2uuJZg-1; Wed, 03 Jun 2026 23:19:25 -0400
X-MC-Unique: 7rvMhNznM3Oloj3m2uuJZg-1
X-Mimecast-MFC-AGG-ID: 7rvMhNznM3Oloj3m2uuJZg_1780543165
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4410cdeeecbso339145fac.2
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 20:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780543164; cv=none;
        d=google.com; s=arc-20240605;
        b=Ziv3SS/GbrZGW7jLM9W/affnYY2W7Y6VLWmcEmxMsI//yMSmwt4ernqUL+4F/Vgoel
         kDhrewtnVEwqS9a45WTKGD6OU6kdM3O4JUKh6PPagQyLYVqO3cV+pCI304IvqzLfn3+s
         x/zQZOcGPqY6rECSR0YMGPZq1p1PmzptYWHEv0KcwGx5RXgaz0gGOfmHzfOs/ekh4nGv
         6pgqH7+KYPjCqLcF8virFeUDsE5KI/gjI5XIZEBqippoeDC5owqGy/dcsPQ8rAz9Cg0r
         HFuzTiN3EzEbLt3YQ3gnl8yU4re8L2ImLjPa1UpnbuvCN1CH4w7rNBTbnPbPcesV7fJe
         MAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FtQEt05HmbWhksD/Qfnja1wIBfLl3h9z1JVOcJ/YiEA=;
        fh=ncutDBTSOZNJRIZ01Q1GEoB3QCCzFk3JqiJNEr06L5s=;
        b=Cdd+9rBShel6NzKl4n0Eyj+BCdcjccNd3x1ETmt/p7ObtjCVfeyVA1HslDbAVg/pfh
         Q5bxdBnNmDvDRQKVgqar5K76ecUP/W8kPrdLEa4gpOOC60Qas+xrJPTXBgqbp6P6lyLy
         qkCngl6bhlf7ZrL3ya94eZxmiWQPiBpJCtf7WB01gwfAq166/O4Py9lnjd5CcjfvrgMG
         up7FR9BECm1vJnO798aCqXhy3dPtj/0mYa+/pmQHE+Ujz1ZfRQifnq2Gw9nTn+jP0jC8
         6J/fTt33DAAvH0zRzS/dd+q1TP8H8mOfLFlEAAwbNuWTWBzUvivRWm6hdQuw/90kSX9a
         6lbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780543164; x=1781147964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtQEt05HmbWhksD/Qfnja1wIBfLl3h9z1JVOcJ/YiEA=;
        b=prPE2yxcfPTEk09plR5cZMa41okDu6uIOhaReDhSZ1KMBS+vLUN4r5e4JY4wwxUECE
         H8NaNYBhTL6U9CQqObyTQwKuJEZtnn7mdEOlk/sPCqxZ5h4zm9ICWDLgF3MySxKZ6ubT
         AwvIoWh/Bi9eU5Du3BrGeC68/Gw2I3BBFav75kn6x4R/W5+QUMzDm+Gn4MlZHLGGXfFD
         ImCGtCqcvncqvXCc6doN25usLHKgEZtAeWorDSjEMBu3t15Fs/aqPh3XR1wq9ztcsrkD
         KXWxdHem52VvFxFTw2Il6qsUzEK8zf4O1wB6PmuuRsLwKxFzzxkzmKCojhHj5v3aIl3d
         GQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780543164; x=1781147964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FtQEt05HmbWhksD/Qfnja1wIBfLl3h9z1JVOcJ/YiEA=;
        b=ZM7qOHT1O+ukrGUmDk/PSjSp6Nxf1Q41NqogMgsOcm6IQdg2A5UBw0qblgLWli9Pzr
         tXqBHIPe6PeHJKjs1DnoasFikOBx5iqoyMSfx7jGCh04SvddY6p05vGewNMa3NpLVOhK
         CWZzCNa6jZ0F0pcMkYuYhJ/5yY0wpqskHhrTiRxrF1PznJEo0I9YX1em2bn8cUnbedWe
         3s2U0M353ey1DZ+aZVQRdXyjt8mtmQHVKq6Q4U9d/GLY5RoJQ00SKZPK6y7jjOW5viCA
         u/cOk02lXSi2FufrTUrzy/MaBQhWDZfP3eeP5u6ClTp7u6ccRa0EzsrlvX2hbt7T+I0h
         yU7w==
X-Forwarded-Encrypted: i=1; AFNElJ9OSP8k8A/xDi94A/iJgszgTDbzUFlPQsl64H0WWnlfkP3KsC31DF5xhw9x+CQiOzYOrrr1U8j0vNWx1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+g2gAOzrvUvb1/4YwDuXgTJgMUxrxihjtPQ6fjtFuG0XlICk
	WsQpzxOsI7baPr3mOz3pIw3cWiIY3hHSsTXT3bYS+uqnYe514V6JpexAwpsUaZqvWcASBamHoxT
	1uG9BB1sM/f8brO3M+0CMi+FxUyrQx6oX2Dztu/cah1v5149B9y7S7sU5C/jJo8dY+/etmNcMGA
	ZGUFkL1RcXXdzsJsvjqZfBamGLMkwI9wFGugJqXNhmMtrn0SU=
X-Gm-Gg: Acq92OE5nsWBHwpHYZ/nj9261nHfHPJcH1Mlc8FFFKrBPXujh5Hx45L+co1A4qYSSrM
	DFK+XIwXbf4jPSlVMaRO+XHyLzRPt9UHWct96d8uwzCTITNjaJAmWeilWavsScjz05j4J7e/PXV
	5mRn7U8TSPpsKhCYSjRrmGFHeMCDteefVkTRgAL/l4pNPZmk1GPBZ2IGVDKtH9on5V6j+8/dCwQ
	xN9BdLBeUHVY+l2
X-Received: by 2002:a05:6870:1b09:b0:439:c66d:2e5f with SMTP id 586e51a60fabf-440db9db7bfmr4198470fac.24.1780543164563;
        Wed, 03 Jun 2026 20:19:24 -0700 (PDT)
X-Received: by 2002:a05:6870:1b09:b0:439:c66d:2e5f with SMTP id
 586e51a60fabf-440db9db7bfmr4198451fac.24.1780543164118; Wed, 03 Jun 2026
 20:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522031121.11968-1-hpa@redhat.com> <20260522031121.11968-2-hpa@redhat.com>
 <9727b97f-7838-4d5f-bd8a-e26dabf1d38f@gmail.com> <CAEth8oGOEdN9wf15FZ_z73pDj9Hw0+zj_8fd_ZMbMwMkBHrUPA@mail.gmail.com>
 <38ba48b4-35ec-4514-b805-74ebfc17b328@app.fastmail.com>
In-Reply-To: <38ba48b4-35ec-4514-b805-74ebfc17b328@app.fastmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 4 Jun 2026 11:19:12 +0800
X-Gm-Features: AVHnY4LJ3ZMlzUIkq7r_eOCrsowWsI7srle-WpHD2c9-fchXIXcNnJ13Yf6e72A
Message-ID: <CAEth8oF_6gPmA8abAyRZbGPK5ac-AjPUQGzVZRKE=bkM1RoBBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
To: Mark Pearson <mpearson@squebb.ca>
Cc: Damjan Georgievski <gdamjan@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chi-Wei Chen50 <cchen50@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,vger.kernel.org,lenovo.com];
	TAGGED_FROM(0.00)[bounces-63730-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mpearson@squebb.ca,m:gdamjan@gmail.com,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cchen50@lenovo.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,squebb.ca:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54FBB63CADF

Hi Mark,

On Wed, Jun 3, 2026 at 1:04=E2=80=AFPM Mark Pearson <mpearson@squebb.ca> wr=
ote:
>
> Note - switched to my open-source friendly email account.
>
> Hi Kate,
>
> On Tue, Jun 2, 2026, at 2:35 AM, Kate Hsuan wrote:
> > Hi Damjan,
> >
> > Thank you for your review.
> >
> > On Sat, May 30, 2026 at 6:33=E2=80=AFAM Damjan Georgievski <gdamjan@gma=
il.com> wrote:
> >>
> >> On 5/22/26 05:11, Kate Hsuan wrote:
> >> > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the i=
mage
> >> > was displayed upside-down. Add the DMI information of Lenovo X9 to
> >> > resolve the issue.
> >> >
> >> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> >> > ---
> >> >   drivers/media/pci/intel/ipu-bridge.c | 14 ++++++++++++++
> >> >   1 file changed, 14 insertions(+)
> >> >
> >> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pc=
i/intel/ipu-bridge.c
> >> > index 32cc95a766b7..1c3364451fa3 100644
> >> > --- a/drivers/media/pci/intel/ipu-bridge.c
> >> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> >> > @@ -118,6 +118,20 @@ static const struct dmi_system_id upside_down_s=
ensor_dmi_ids[] =3D {
> >> >               },
> >> >               .driver_data =3D "OVTI02C1",
> >> >       },
> >> > +     {
> >> > +             .matches =3D {
> >> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> >> > +                     DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-14=
"),
> >>
> >> Isn't this going to be an issue in the future if/when a "Gen 2" appear=
s?
> >
> > You can look into the v1 [1]. The DMI_BOARD_NAME is used to
> > distinguish the types of X1.
> > v3 covers wider ranges of X9-14 and 15. If we agree with v1, I can
> > revert this patch to v1.
> >
> > [1] https://lore.kernel.org/linux-media/20260417083214.222189-2-hpa@red=
hat.com/
> >
> I happily defer to Hans on things like this as he has way more experience=
 than me, but we usually use the BOARD_NAME for identifying platforms every=
where else in the kernel so that feels to me 'safer'.
>
> If we do go ahead with PRODUCT_VERSION it should probably be DMI_MATCH_EX=
ACT instead. I think that will work fine, but it is not commonly used and I=
 would worry about the FW team doing weird versions for different markets (=
the two board names are very standard for Thinkpads)
>
> Mark (currently on vacation - so replies may be delayed)
>

Thank you for your clarification.
I'll revert this patch to v1.


--=20
BR,
Kate


