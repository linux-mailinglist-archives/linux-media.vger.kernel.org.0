Return-Path: <linux-media+bounces-56962-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MhiDsunw2lssQQAu9opvQ
	(envelope-from <linux-media+bounces-56962-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:15:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 873A2321FCB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDC6F303C8D5
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3502351C07;
	Wed, 25 Mar 2026 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LE2SlSwa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C2434E75A
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429961; cv=pass; b=EmS10IWeb9m8Un2kle9qK9sPXei7cRwGRx00cEZJVCZWIbbUgJ+UYBGFV0kiQ3Gdn6dFrU+YB6+L/6B7TEbsOzSq8vX+ycxrzDHvc2X++rTAqG0HRA+FOGpwjfFIqexNma28tDE+vST0qVhxawC2h/aH6RqoqO6DYMbI0WG+bR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429961; c=relaxed/simple;
	bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBGwfXki5YvAu71ZHhINpaj0ySYuJrFXZmFjBw+TQPj+yUeZi9TJJjHJoQ/krUlQHffsT9lkhD0NYZRoopwC4lvs5KdBrRcmNnf/udebYOkVDjc0QjztZ5HJVsMwJtK6Eew2SDmhwCTv7do1N6d+gWDjgygn1XxRBMA4JN47YlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LE2SlSwa; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94e9810221cso975200241.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 02:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774429959; cv=none;
        d=google.com; s=arc-20240605;
        b=CB9fvCMdTIpeBA0P6vJ+XT/Lm4mPIpNYP4HfcwdmOOyUTCsv6SdPNOW620BHCztRka
         213PQi5Lxe/S4og3TVDfNKKGygkMxW2CN3oi6xmO8KkM9eDcZ9hRJ2TbPbrChLn+AQln
         PE4FiHczHUpm2NgSHRQXrtN/8A+BuM3Vh/yOQ1ZBjBa3faJDjRvSwveexhh74o2+P+0U
         laJg7kZ5a71bLILHT8ryzPnpbipmzOEdh8S4UkMTmFAV4savyfa6lVJZfu0mSS4g/R8C
         FkHq3kD3oKNGFOvStFSk6RqJ4+9Tl/yOX+9lXH/u04FVHtnjmSrFftVwsZjNoLCvnDNI
         ZpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
        fh=91VLlhmzCe9I3aREa1TMgiJdQbErmtBV9wA6xLf/+38=;
        b=kcx6J3UrRmuXZ35DYy4XdXeMI5Jj/yOOPzmA7/ECSJX9MBziTsLtpTzQbRe2doO9Uo
         PjAi+Ka1jeadajjshqAh5RhznhFhszEsIb2CdI7Cmbybdh1xnulDDtzBMIVHeZr2QbNH
         1AWW9hBonrqmJVa16pDpEDWpUtLWCR2IcReRzTOnwCYxZBiL6JFzZTv3f3gSsxJ1t5xr
         JaRiN4qoUJwZJ2rR7dsdBsbgmtxcoaZh0wakPRvOxlpOQ/nm1ryDJgrbZs2Cp5R50nkG
         l838L9h5sDx7f2HoCr9z9Xw+OzPKksNE1fdC7IiyvV7pen40QZXVNmZNVCx6MojwZRKT
         XsgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429959; x=1775034759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
        b=LE2SlSwaCCKdFFFoQYJGVheA7BZg+mNVNtu0iu74vfXMMLe8TxNTGE8b3g2NdGpIeN
         ecLEo1nCh5qWp+oYEZ/JvSUlijo7ush9ECvAzyZgoyg7bA2Ao4omTlSdvl4toSlrr3v/
         m1IsvnofM2J8GTnptR/6YOJWDOWzaeQWj64Qx+k8UFpn7+78gZjoQpFIKRf3oSO5zjjj
         5hOvsgyE+6888uqhPSeEgTuIJc+81BdOUJiwA8bcebdW0gUgXp7Rkui2WI8Khuy5qZRg
         kLPGsHc5IJRtYq8SSmd3o3NWMIfegquBOqichN5p9zVHqMeIXLnGs40EIEfKPsJapLud
         NHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429959; x=1775034759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERjI4uj8pVro/iRDfLBEQ4eug9lCPVkwP88gVFM7jYw=;
        b=Fkrnt7p3kpoajdSxembyAH7h2SHC6EyijkepusYD8ikVHpyxxf1Neh4wMEfepyzMj2
         2Xb5gUIF8pe9l2tdoEP8E9ifQD+26nnkwUAWvIK4K3mERaG9llp+gJjajURWU9N0DeKn
         jncj2c+HWt5RbODY2Ufu4cLlsFw0sSaZTbh6BUGpaohEE9XdxH5XcrjEQJzvPLQ/Xe+O
         3oPQ4joR+6iKsRSyinIJ+lyNuJtgvMXRe3lxgeesaqYf7O6PucKE6S81VYx0uu6i+Qqs
         Wj1GbtDBjNLTePsYcJCdHIuBX8TEKgwQsAGoZxaZIrmwKdIHCXV6sVi6aErJ8Tels+GU
         CBrg==
X-Forwarded-Encrypted: i=1; AJvYcCUTsyfgAf4jUK2V3ze8UqgxnN7Slcdbhac4NmPXKahL9rKIO8YVTJOvTry3irSlknwfoa9nqax4LdzEQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWLvizDu/YXOT9doYPzF+YDYQwMXiiBTwyipTe6lPmWKoB5Db
	WQFHLOZNvXxWiXFAaQL7LPoy0z564ILPgEInFCPZ727rk9CXcpBRTvSiZdCp8nrUxrUKdGZ0GHs
	pt9Wp3Yfn0hcoach4S3sg7em9WFbHDmCdyiURWeI=
X-Gm-Gg: ATEYQzxzdbyKvRDSwsDdEv/pwQ4xs3wYMVpFctmcVRtMATa73gWMs6BmBQ7Q7/irI/b
	2HDbgwoHc8mHkmJhG068VxST6yUc0roSoQ61hyyMyXOLCWQBE3lRv7SoYvajDb+te100l/wi03E
	yFVRYsKU9D6BfHTY0+NXv6b7fhLHN7hx7E4ufuK1cd6Sikp6Fph3QKfAXzpm2pOAC/oGmWSxWN/
	Q2lAvWJgAiUwXmPDA0rPmWJUSfotIYCW485t9EMGBwa1IoHjM/yPG42rHFMLO9TP5pajuiY61GN
	D25LULg=
X-Received: by 2002:a05:6102:3e2a:b0:5ef:2457:8015 with SMTP id
 ada2fe7eead31-603872cf768mr1246351137.29.1774429958938; Wed, 25 Mar 2026
 02:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acJ6sH4yUyity0gu@ashevche-desk.local> <20260324180821.42084-1-anushkabadhe@gmail.com>
 <2026032514-floral-preachy-bdb4@gregkh>
In-Reply-To: <2026032514-floral-preachy-bdb4@gregkh>
From: Anushka B <anushkabadhe@gmail.com>
Date: Wed, 25 Mar 2026 14:42:22 +0530
X-Gm-Features: AQROBzBZEMOajOANo1y9YHJJ8VR250nGCap-Tmz8jIbRoNqHIDDFDalNkNp7zJk
Message-ID: <CAAfE=nPo7obbJ0CLJ8krNM2UD2hz93BQdvmzjfngAWRk44YxXQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: pci: fix block comment style and
 merge split declaration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56962-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anushkabadhe@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 873A2321FCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 2:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Mar 24, 2026 at 11:38:21PM +0530, Anushka Badhe wrote:
> > Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> > ---
> > Changes in v2:
> > - Fix block comment style (move closing */ to its own line)
> > - Merge split GP_TIMER_BASE declaration onto a single line
> >
> > Checked the rest of the file for similar issues; no others found.
> >
> > Thank you so much for your guidance on improving the patch.
>
> For obvious reasons, we can't take patches without any changelog text.
>
> thanks,
>
> greg k-h

Thank you for your feedback - v3 fixes this issue with a proper
changelog description.
https://lore.kernel.org/linux-media/20260324194356.49090-1-anushkabadhe@gma=
il.com/#t

