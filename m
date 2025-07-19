Return-Path: <linux-media+bounces-38112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D32B0B0A3
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 17:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 229747B23D7
	for <lists+linux-media@lfdr.de>; Sat, 19 Jul 2025 15:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA9E1DF74F;
	Sat, 19 Jul 2025 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="dbuZzHdS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC97881E;
	Sat, 19 Jul 2025 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752939192; cv=none; b=a1SXyc4LK27z95NU8AnyUoRNpBSNoF6befFjWUROjazP7evgbuj34zCrLVFdNpTPSxmwNxTrMtIIKj7LWkZALoxZ6LMXJWkpt3osDX49pbFQp6oHg75AVdVfklLeiRzOCty6XayaDD1CN2L6oxSHY03PfH8dyaDQJkSw0EKaQS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752939192; c=relaxed/simple;
	bh=OBZQrwev9GUiAlYnJZ/8ykb7H48SiKdk51D6waAUGhM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Hu4ybxxIc964b2TK86NY8b0yA0VRTM/2MU+xvhoJ3UP0giu6HoRXFWubFRFcI7RV/MlY8o//3zJ1rNg1+0GpZfPF+LAxfQm+eIC8S71LnVyy0O14YBFR1inrQ/0TpEj/xcZCfMDy0TsuvmHjdn3OBwAHktv6udOWvHNptWLSudk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=dbuZzHdS; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752939188; x=1753543988; i=markus.elfring@web.de;
	bh=OBZQrwev9GUiAlYnJZ/8ykb7H48SiKdk51D6waAUGhM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dbuZzHdS+oppGTWtCp/f94+Ns1/94xYaw5LVq5rt5AvpP/O3tQ0YCGebg6likLvD
	 KEvzxCrNx7IoDBdkF6woIgYOlFEjjFs/3t5tX0POogYVHvbaAiY5fKFkXNCPflVK6
	 ekEPyzFhkXB65KTchmqv5PD2ST/S4YcoTvHFLUCF/rPhNBCLnOaWlkrjAhvYYJftL
	 SFGl03LaVtLJib+TAc44fV+As+nF8k7fHZ7C7sVLa0hY7rvYhpUK5wAvig+IS/nQ/
	 2oIc/CqI1VTXja2ER1qtwDxZEJVsjm9wt6doGN17rJh90QM0OV8a3cZC2aq/5Er5x
	 hVivNUE34jq0l6l1Nw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.241]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mq1CA-1uyPTS1HMY-00Zfk2; Sat, 19
 Jul 2025 17:33:08 +0200
Message-ID: <5ebbc122-739b-40d5-9fda-df0791c6b7f2@web.de>
Date: Sat, 19 Jul 2025 17:33:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Darshan Rathod <darshanrathod475@gmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250718132929.95115-1-darshanrathod475@gmail.com>
Subject: Re: [PATCH] media: dvb-core: dvb_demux: Fix assignments in if
 conditions
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250718132929.95115-1-darshanrathod475@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ogCQrVsZMPJ7xqt5PDDAm1I+8FkUPBAECxGsR2e973MixjCVC3D
 GlflD+a9AJiDFvfrjc54qdErPlm6VgdleX2r+Jx9z//dNRsUZ4OKpI+CwXcWCIrJGMTwQp6
 fFcEbvN95Ug6yr7m2B3OUaQVwXej1aOpbVYJ4VDviiQLJk06LkSgVdzIxrJaesMTVM6KSB6
 mMatr2W9YuKuBjHJncyOw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5L/zMYUA60s=;EVJc5GqNxKrkkluqXmbJvAO3wU2
 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
 kRzeWZqArdc2flWoZLrDuOjHWiKemNArvxE

=E2=80=A6
> This patch refactors these instances by moving the assignment out of
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n94


> Additionally, a minor whitespace issue in a function signature is also
> corrected. This is a purely stylistic change with no functional impact.

Please split possible changes into separate update steps.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16-rc6#n81

Regards,
Markus

