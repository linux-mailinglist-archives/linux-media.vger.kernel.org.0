Return-Path: <linux-media+bounces-28955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93CA75149
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 21:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32F916EF40
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 20:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAC01E51F9;
	Fri, 28 Mar 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="FaUQLC1P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059EC19AA5D
	for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192621; cv=none; b=bL+aXHWM+9OLytRvmg6Hfs+yKKRTIWmzG7HpIo0PASsFghZNiQKEkiKptp5MXOA2WAy91mus7Ojjc2VRn/b3o3SAUQHM6RMKpojTGfG6PCmHYcn+Xh41df/hf288Sy4xESJD6/v60ymXkVgrgmIhqu70Xj0yGJHd8HefaZsqIbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192621; c=relaxed/simple;
	bh=Bo0MvhUfgmX8AHGtnuvjG7ebaJMbSTOK4rGTfPtnCbg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cGJA3CrSfOhwryo4ZUI+Cs/YfzZxUz5XIAQKI7QcSoMwl2fN3lAvoH//rGZfs5kIMxf0oxL7H56Z56EN8iDr4MJlnwaBCD38grfzxGE7+lkZNhMx9Huc2oqdecfzd1FCkRMJXkwVNKtGA2c2zm7MjbZlpxTTmKcdMAUdDzR0O5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=FaUQLC1P; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8fce04655so24366346d6.3
        for <linux-media@vger.kernel.org>; Fri, 28 Mar 2025 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743192617; x=1743797417; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bo0MvhUfgmX8AHGtnuvjG7ebaJMbSTOK4rGTfPtnCbg=;
        b=FaUQLC1PqHkPLMKJP40nlfhe1vxtIwk6Vd2CruQH0MZkjJTtRXjKWtW3D3ZARLB1zm
         91NEWOjzn7M3yfIJad9ZGamxWlb5xkMrH25sy5xW52xr6NCtw85dMJ+2JYgJMQuAaR55
         9x6TB2cWIv0qXUay0YHku9VFOWkmR7wrBw9dIvFSpZz6atTzVDj4yJFi/vi03ZtQcdcw
         ZJ+9IXiyRPH+O+2ejne95j7pHsCzfyEOyMvz0o/ec7ZZwd+crug45fiQRQiHL6zMzjQR
         h8+y3lmWMD1j4a3ilWpX78N0fn20ZReCJ6tu4fqqDVcXkbVCLGTNtmcywxFoUQ6ccPPg
         d00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192617; x=1743797417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bo0MvhUfgmX8AHGtnuvjG7ebaJMbSTOK4rGTfPtnCbg=;
        b=HQ/HmlvMsvYIRoAxsCLulnK4aMfoU+PSpMe52QdkrpPAZ89R66cn8d9xhXBoEEZqze
         fVYnuQNnCSFGbhqcfiN4Yx3whXj0zcAWyUviPY6zjeRIN0ydAqgEKHi8OaFF6ug4BOfH
         03gL1wSQeDNaNdreQAkbPr5jkG7BTRzlwfjJ4rS9NrIxR9RhmqutS4Bdp4/FbAL9j5xd
         Q+YP8QIzcV2X4fRsmG4iyn8OX6s/VbGaunLLbfaJaQdyVCmAYpLSyPOPw2gVEZaU5Dfo
         Dk4Htq4HSDNPnEdnHyGUhN0Nn4KEYyHYpYSFO9FPp1lMpu3MDgxtd0RSaumh4Y8JAGI6
         gTHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjEw3/s80prmUCH8oW3FvpfByrogAm90flG5GakJK0NvLesWrxfSzg7HhdJG02w6ZyK5WS6cIB/aE/WA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0iCRJkXNlSGqy28ud0ypzG41vz6H5x7bo6cJwWOETRg22f6aO
	MeHkBipPDrJC4b4u+UTRyCCMRGn4y+qPWqdcg7j7oXyJ6Mzo0X/ymMvNXcs3JO0=
X-Gm-Gg: ASbGncuYbQSd+iubPXw3Rac55tf+URICNmADMAdMvQolbg3uvL+Zgw137dRlXFeHoJj
	zNMK/Cro/Mhc8odO0/rDWLrjDLb25HahN9n4WcSxa84l8Bx7p9JwJfjIKVajMYJJ4s0MkMcBhLd
	xxCDjHmEoC+EhvHMaBbATxvxdakTTe3kB4d2ZLdPh3ZuJujS43baWbXdZSmNAo+yXC+vG0Wsnlm
	BybV5psELEu3Hk6AJ+P9Ik4gQGVY7bn9WAS5BwvlPOXFiRQzE4kSBFCJq8jowE0FECRhw4h/hJn
	WjZ4XXOIAjz0ZxSu35bCDfoPqNhs3cMXDb4F2JUu4P/ss/PxLw==
X-Google-Smtp-Source: AGHT+IGY3/yeWHUdX83AfDfc4gZf/5UfX/+h1QNXCAMEtrH6poe80Sg4oMpR0ix62KbGIATouMZn+g==
X-Received: by 2002:a05:6214:403:b0:6e8:ebc6:fd5f with SMTP id 6a1803df08f44-6eed6058b2bmr7584886d6.20.1743192616660;
        Fri, 28 Mar 2025 13:10:16 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9627a16sm15108726d6.20.2025.03.28.13.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:10:15 -0700 (PDT)
Message-ID: <6a8d0130a4d1fb898e66647b637006759ddc2e32.camel@ndufresne.ca>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org, Kieran
 Bingham	 <kieran.bingham@ideasonboard.com>
Date: Fri, 28 Mar 2025 16:10:14 -0400
In-Reply-To: <6by25cpfspvgcejsq663vvq6y5po2mau7r7z6p4ux6wqiwgv5p@vyxpbzwpsrhh>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
	 <aec691edc21205dead06f4ce76ad225662ee60dd.camel@ndufresne.ca>
	 <6by25cpfspvgcejsq663vvq6y5po2mau7r7z6p4ux6wqiwgv5p@vyxpbzwpsrhh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 26 mars 2025 =C3=A0 09:13 +0100, Jacopo Mondi a =C3=A9crit=C2=
=A0:
> Hi Nicolas
>=20
> On Tue, Mar 25, 2025 at 02:12:16PM -0400, Nicolas Dufresne wrote:
> > Hello,
> >=20
> > Le mardi 25 mars 2025 =C3=A0 12:27 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> > > If you would like to attend, please register your interest by replyin=
g
> > > to this e-mail, and indicate if you have any discussion topics you wo=
uld
> > > like to include in the schedule.
> >=20
> > I'll be happy to participate. Topic, nothing big, maybe we can spend 20
> > min, I can share an update on the state of the GStreamer support, and
> > what is missing, and I'd ask for feedback to complete and prioritized
> > that part.
> >=20
> > I'm also interested in an update from Jacopo around multi-context MC, I
>=20
> Indeed, it was something I'm planning to propose as a discussion topic
> for linux-media and I was specifically looking at discussing this with
> you. Do you plan to attend linux-media, or should we set some time
> aside outside of the meeting ?

Yes I will also be at the Linux Media meeting too.

>=20
> > don't feel to dive into sensor configuration, its pretty clear this is
> > what it is and will be exposed as-is through the abstractions such are
> > Gst (I'll make patch as soon as I have the time).
>=20
> Thanks, looking forward to it

And will be around till Sunday as GStreamer spring hackfest continues
over the weekend.

>=20
> >=20
> > regards,
> > Nicolas
> >=20


