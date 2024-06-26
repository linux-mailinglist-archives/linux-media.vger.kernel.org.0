Return-Path: <linux-media+bounces-14144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99F917844
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 07:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD9E1C227A9
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 05:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E86149DF7;
	Wed, 26 Jun 2024 05:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUEBLhv4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B6A48;
	Wed, 26 Jun 2024 05:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719380784; cv=none; b=XgphRYeE+d2/QML7Yvh2Xza0e12YL9VLHJuGIFwS8co0zymG+uyQFez7yvJT2tgNuVBVc8bXQ2b/V0aWEQ+3MQO4Qjy2iP5BjesOa/WE4mbZCMhFN0FLBpCCU7SwHRt/hbgZySS9y9SCDdMzJCfw2F2+bHRhJXFBIae8GTWV0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719380784; c=relaxed/simple;
	bh=QWXrZWXXTVJTd9LZgMr466gJ/DYBUPEheTAJm7xvudc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/GLJ0s5g0PqirhP181CJZO6KcItyEaBF+GUZAf7yoDFyNYKehGqUM0vtr/aj3xWdXHcEa45qSgyGiPGRoa18T8PItImhdX3NSpPe+5f+1Y3q50J09bN0eWSBUkxCZhk2bdbbAbMhf3XKc3ypwxcJYtGb+6Shdhc44oseUmWXl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUEBLhv4; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec4eefbaf1so53863311fa.1;
        Tue, 25 Jun 2024 22:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719380781; x=1719985581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSB3BTIzSPzX7DCyduN3KYVksS6dE06yAl0SpQD8nwg=;
        b=hUEBLhv4OaMA1nV7CMWc6JL2S3IVthyuggJ+T1ikgd687YmIgGPPnbCcLc4kIZDCJE
         beKvwA8eip/ifsEZq1X+iPuE2AB4TvKb7W1bsZw7RlW9sKBaO+smIt9pvQqEdgnPglKS
         2xCaGhV4z+nTulkdGROTT5NaqvieZ6HWihvqlZi2ZV39tJjul7qCCHUr6TDJPB2QbNWE
         +neyPy9rMyrjK0WSbbAXHXpgwonbnUPU7ovqjU32YyGPEO3WRJLoa7yYHi+SY0tzGyCT
         0hdEnz2us4KggKE8EUDk8/kqMhYSuPnHvdMk2zZIkSC97GbJiMOCggM9b0XCX+hhhdzT
         orGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719380781; x=1719985581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSB3BTIzSPzX7DCyduN3KYVksS6dE06yAl0SpQD8nwg=;
        b=gHi23wxlWJEO76k5jVX0USs9oOo3NfcZ38FU9XCGDFF1qah42Ul8jAjzVbsoBB0SIp
         C65InBpeimsfxgnPHu3Vf2S0gkrDxGSV+MV/jIOCtDpV7I0jT1KC91lGtbRjM0lIJ34+
         PpYJ5+ruIuuj50V5YTA2FhMexzqwMT1nyLRPw9yH4r7R6nlDk1dyqAWVe7FtamhVlqtN
         qHOSKic35QirqX8wlD7bwDd435Xij7Nxbw4DEqMftYGspXgAfg5oy2m6wE+poB3/MVAU
         NTndyq623/AFe/DxtI64hTQ/G9klpcbo5/0AB54ReGSR4cpV7UhAI1MATMh3BwpRMvWk
         xJog==
X-Forwarded-Encrypted: i=1; AJvYcCXGw2rwLIgBmqgPrv5TAxH9/+459gzAl3454Lf7AfNIqSlrRoK44CbM4sS3u2QsqhGB0hOdn428MoSJmOeDdlk9eiYkHI1x43UTPP2KCVmWPGjbwnZ46Rkm1rg+61+ufUzV/E1jvKiiHf0hVRw8ULwcbDD0VS58H/CbqYJSbYi5hrctyfgHbRgmDNX8NGk88fWREphy6iC+FOmWHnqDeVvJ3lXdZQ==
X-Gm-Message-State: AOJu0YzvB6zGM8psrdcnbH/cy40oTnGrFxuA1babwEffnCYZ0FxmJ/kE
	lL6zOwhN78aZukuxg3RHb5qvdK6Om1xYDqOzrZTeRAHJMYCI28uoZVkN0RbmuVbfqFa//ebs5q1
	sg+G/QdcNIcdtBlMe9xeeYIdTTCs=
X-Google-Smtp-Source: AGHT+IFpWX0NPzvu65s1n+ek73NwrFfQFyjSECjKUTt714nna469hEmm05axgbn+rQ3sHDqAkDQPMlbu41qjw7daXd4=
X-Received: by 2002:a2e:9b55:0:b0:2eb:d9a3:2071 with SMTP id
 38308e7fff4ca-2ec5b3e358dmr53538951fa.50.1719380780963; Tue, 25 Jun 2024
 22:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com> <3e55d482-2732-46cb-906f-62f0e722b7a5@linaro.org>
In-Reply-To: <3e55d482-2732-46cb-906f-62f0e722b7a5@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Wed, 26 Jun 2024 13:46:07 +0800
Message-ID: <CADgMGSv6-J3re9w2wqTdxd=y-t=APVP4MA72h+0J8M6gzd=wPQ@mail.gmail.com>
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add qcom,sc7180-camss
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:32=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/06/2024 13:13, George Chan via B4 Relay wrote:
> > From: George Chan <gchan9527@gmail.com>
> >
> > Add bindings for qcom,sc7180-camss in order to support the camera
> > subsystem for sm7125 as found in the Xiaomi Redmi 9 Pro cellphone.
> >
> > Signed-off-by: George Chan <gchan9527@gmail.com>
> > ---
> >   .../bindings/media/qcom,sc7180-camss.yaml          | 328 ++++++++++++=
+++++++++
> >   1 file changed, 328 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml
> > new file mode 100644
> > index 000000000000..58ffa4944857
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-camss.yaml
> > @@ -0,0 +1,328 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/qcom,sc7180-camss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Camera SubSystem
> > +
> > +maintainers:
> > +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Please add yourself here.
>
> Other than that
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Would you please be the maintainer afterward? I foresee that there
will be difficulties maintaining it my side in the long run.

