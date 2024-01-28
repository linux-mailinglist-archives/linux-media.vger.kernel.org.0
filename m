Return-Path: <linux-media+bounces-4296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC94B83FAFC
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 00:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73552285A31
	for <lists+linux-media@lfdr.de>; Sun, 28 Jan 2024 23:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4AC446C7;
	Sun, 28 Jan 2024 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="O+q/zKKp"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6534C604
	for <linux-media@vger.kernel.org>; Sun, 28 Jan 2024 23:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706484830; cv=none; b=TUlMC2GPVZhjSKXDV9P2SvW2D6+a+7TijVDOEWxsaxI9LOwnv5bM8M7YwtstdvV9TxahYRVUbmi0tAKEGhWQ/nIdF0LwytUriaC5vYzuDWNyVV+6qVHXLwlSFG/RmZSi6vOZKO5Cdi7YXrxyH3haWzf3MaTHWVQVQUYsfUx6NN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706484830; c=relaxed/simple;
	bh=uoJ31O5b7CZkW+6dI1cGxiKARLFJIW1ycYSAGKB5faQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KiAPc+alTlv7J2aHEptS0J4WC8hAG4ZpDokWoOK5YSk7mUsCJAe8E4XO1kxD+QweR3KudI6K4Z3kNo+jUaX+Besnz53xB9H8lMk8i0AoUu4LyVy/EPBQyTGXAw4Hrv2dAu/UX+RFONUrk9FZIW750p5f8pxRggQdVEGpC4OjuZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=O+q/zKKp; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nurfuerspam.de;
	s=s31663417; t=1706484819; x=1707089619; i=herdler@nurfuerspam.de;
	bh=uoJ31O5b7CZkW+6dI1cGxiKARLFJIW1ycYSAGKB5faQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=O+q/zKKpQIjrGHEMSkMPIz09ZljgyRRRL70VJQat+UKpjeyYefWH0GkT3UI71N8O
	 g6yMmJ69rKSJXlwNgk3SA1rZyG4C0Vx95Djm03Fqs5SoBf4rhD0bVHICpEqmxAg4/
	 gbtS30F+GSbtQ8l9z3Is+Rc+MO4ipCzraLonpaAMhXKZqxTBEYX92vS/q0ULx2wOZ
	 PsOKEn5OHeXKSVHUp3+EiEu8dnVzORy5DTAgpSPlaz1gFiz89g5+jLfLnLsTvFDHv
	 FbTP37FBMc0sPgBQ5Z+lSgQLR91MZ2kOu7A1Rpc0BEaKb8ua0e1dirgABaoTY6NFC
	 vBxwuiRT4r1hWoeAOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([185.101.173.202]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOA3P-1rjrpK1B0r-00OWWQ; Mon, 29
 Jan 2024 00:33:39 +0100
From: Stefan Herdler <herdler@nurfuerspam.de>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	smoch@web.de,
	tmn505@gmail.com,
	vinschen@redhat.com
Subject: [PATCH v4 0/6] media: docs: uAPI: dvb/decoder: completing the documentation
Date: Mon, 29 Jan 2024 00:32:43 +0100
Message-Id: <20240128233249.32794-1-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20230327192826.65ae299d@sal.lan>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a1NSKR/0WUUcyYKddAJsU8NyUR8iXTuDyfVlS6uOh7E5u37ukTO
 990zSunEUjV9dS9tfdxSsG3+pckbrtOj0wxOafGCd7AVtYOJq7c0QVAaDrKZATYDH31QMcU
 sOLL/Zq0jrR8xQNm+1gMRPkis1JL2QQavhCVCpFI5pW3Zgwz2XplM9RFjdxyRyu1aroY7n6
 efXicR0it3GY5RDRNKeZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:x3nOUZHbZc0=;D9lhKsQ9wfoGj3QqD84L856uZDR
 IKPHQPLw5Juocq8I1myJUL/R6A2fVbq9avaiWUIHZ94mhvYK/VOPMJFQHf6w1btP3FfvZgoAu
 iGUAloFNk6077378YU/D5rTG4/CpXuq+tjzZIVb+DDi2rBDZ8rLfTGvuOaSWCw/+X9bNrsd9n
 MXOwai2Y75RQpp0irz8HVAK4EufJzMQF6K3EtLEo3UQN4WVqFgtD9Em1AiOni6+LM2H9PE6X2
 YlDfjQ8tAig8wrC4KqEdibOsPq2HCypBC2owHjHRr0IasHw0LubYzSrztWfhYXFgr+CNekEzQ
 SxqBvsPYuJo0Unf9wdUZbRB14Sz+fAQbbwFILD//kf9kv/3wGbWO01YzzNqkiE2duiR/fe+u8
 dwF4TqYRR92VbRI1kSZ8kd8A1uOMEoUuUEVg6QukXBNYD8hGE9HEbmExh/tFu40u8V+l9fex4
 zz2qLYvRGpSz3lH+Nl9+w0oyJQHXJ3ACQaFjquRFTB5qstqoaUFdEA2AtPMM+x0su75i0p3Y/
 xXugKo7xV8SoMaeEGNGlKDXSS4/WANxDY8bvgBH7LVH05rqbwdl3JjQFHrvMcZcy7VaOTqftF
 TDMBZ30VQn6/YRPq5F/A0ubH0cho7UwW4ChgvaTWjkuNEUViOVsv7Xt0IcgxFcigqOE4cl2UP
 JJwelXv6B57JpuAG8r/+qn9jGdyPH5cT4pXAG4oyoGw7pvTJImoulaqAcz7m7ELoZ9qN/v5sa
 StutZxLliaUKX4SycZ1OC4up3WMOgac1aXEnNm17emPlCv5ZIYBD1KtNebWe5hyh25CoTsbAF
 PKHW2CC7cSv6K8aIhS83vpa4RNEdTl6F19gb0qpYYVw05ongnDTlcJ/qx1HIH7Aq26rw9bOPD
 E3r5BV3cICBWCwuC90RWEhzYPhS+txQ2d7Ux0ifvz72/SU1HJr68FRMgOE6cDTiVBzYqgnVTq
 wGZz4ZxT8U8jT+98YV8YCCsmFW0=

This is basically a resend of v3 after 6 month, with some minor updates.
Changes since v3:
* Adjust title and description to better match existing documentation.
* Fix warnings from kernel test robot.
  (At least I hope it is fixed now, I couldn't reproduce this warning.)

No changes to the text it self.
The layout is still identical since v1, just split into multiple patches.
My comments of v3 attached below, they refer to Mauros comments[3] to
v2 and still fully apply.

[3: https://patchwork.kernel.org/project/linux-media/patch/decd5d71-f06e-5=
873-5ebf-7028107f65ee@nurfuerspam.de/]


[PATCH v3] (July '23) ---------------------------------------------------

Changes since v2:
* Split the patch into a patch series.
* Incorporate the changes requested.
* Style updates to better match the existing documentation.
* And a lot of small fixes.


Hi Mauro,

it took a little longer then expected, but I didn't had much time in spare
for this. I'm pretty much occupied by other things at the moment.
The winter season would be better for things like this, but I try to
finish it as quick as possible.

I went through your mail point by point and I'm confident, that I was able
to sort out your questions now. At least I don't see anything that need to
be improved anymore.
The work has been done in a lot of small blocks over a pretty long period
after my daily work, mostly late at night. Despite double checking
everything, I maybe still have missed something. I hope it is not too
much.

For usage it has been checked against the known projects using the DVB
decoder APIs:
* The AV7110 kernel driver.
* The out of tree driver for the HD full featured cards.[1]
* The "Enigma2" sources from openatv team.[2]
  (The drivers of the boxes are binary only.)

Possibly unused items have been listed in the comment of the patches.
Please take this lists with a pinch of salt. With the number of items
checked, it is pretty easy to miss an occurrence or have a false positive.
Although I've done my best, there is still the chance that I've missed an
use case.

I tried to complete the documentation of this unused definition too.
Most information had been collect anyway and writing it down wasn't that
much of effort.

Removing the definition and documentation later at once is always an
option.
I would prefer to do it this way, if something has to be removed.
It is easier to revert the change in case of a regression.
If necessary I can provide the patches too.

Regards
Stefan

[1: https://github.com/s-moch/linux-saa716x]
[2: https://github.com/openatv/enigma2/tree/master]



Stefan Herdler (6):
  Add documentation for legacy DVB decoder API
  Add documentation for osd.h
  Add documentation for audio.h (data types)
  Add documentation for audio.h (function calls)
  Add documentation for video.h (data types)
  Add documentation for video.h (function calls)

 .../media/dvb/legacy_dvb_apis.rst             |    1 +
 .../media/dvb/legacy_dvb_audio.rst            | 1642 +++++++++++
 .../media/dvb/legacy_dvb_decoder_api.rst      |   61 +
 .../media/dvb/legacy_dvb_osd.rst              |  883 ++++++
 .../media/dvb/legacy_dvb_video.rst            | 2430 +++++++++++++++++
 5 files changed, 5017 insertions(+)
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_audio=
.rst
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_decod=
er_api.rst
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_osd.r=
st
 create mode 100644 Documentation/userspace-api/media/dvb/legacy_dvb_video=
.rst

=2D-
2.34.0


