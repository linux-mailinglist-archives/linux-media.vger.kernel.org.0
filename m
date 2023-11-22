Return-Path: <linux-media+bounces-761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB187F4193
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C46A1C20918
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8D63D98B;
	Wed, 22 Nov 2023 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE68191
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:26:40 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507b9408c61so9018351e87.0
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700645199; x=1701249999;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kuv/Mn6VvNC4VNrtLu2slhjggT4FZXYddVEie7/UhG0=;
        b=Q6XwjszQlD2+b6k8YevAemXfX/4tbb2QfDziPX1TynUJO+ZjpGpSvih2I5r1lY/mFe
         2mELnjcDe/lRP4k7A+rTTtA2MqoiBoCaKG68LQQDQX1WMOjGwywvsn1YxymcYJSZwzZn
         T7r+l5PAscBivVA7zWdLqz8iFgF9WtZpdS6UgddkSzZaRXx66DwTCfuXzwawLNOYF37J
         fv7uXDoHZFgaGJQwiNjajytJYKOyj/jn4Fe6UGn26X6LZYo2VPUGmfFug0ynr7tasReM
         ks7/xzXv4c2YDKD1+lX6w8MknylAnN/mcXeYETJmiNMvi8snO5FF0S6vD/8KjW5j/4VF
         q71w==
X-Gm-Message-State: AOJu0YwkVlkd3kvCRjzISWrM5l4npYqt3Ff+Vr7O6NsrW7mx0s/K575K
	dJSqL85uoS3mnu4ZVK449r3GEYmDxdW9vw==
X-Google-Smtp-Source: AGHT+IE5DylTI3SzMxWR/rWskovq9X9cIytGcOQmxf2Z/smo4yB2BtLGr90kKmr5fUa3V7bOwSSvEQ==
X-Received: by 2002:a05:6512:3049:b0:507:a003:57a2 with SMTP id b9-20020a056512304900b00507a00357a2mr1480549lfb.52.1700645198482;
        Wed, 22 Nov 2023 01:26:38 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id o6-20020ac24bc6000000b00503555aa934sm1793372lfq.11.2023.11.22.01.26.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 01:26:38 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so83330921fa.3
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:26:38 -0800 (PST)
X-Received: by 2002:a2e:6e19:0:b0:2c5:23ac:3672 with SMTP id
 j25-20020a2e6e19000000b002c523ac3672mr1132433ljc.45.1700645198180; Wed, 22
 Nov 2023 01:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 22 Nov 2023 10:26:27 +0100
X-Gmail-Original-Message-ID: <CACXRmJg4vKSQsXyC15LdQ5A+7Yaf+AaHmQ4sdbXNkZJ05edeWg@mail.gmail.com>
Message-ID: <CACXRmJg4vKSQsXyC15LdQ5A+7Yaf+AaHmQ4sdbXNkZJ05edeWg@mail.gmail.com>
Subject: 
To: linux-media@vger.kernel.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,


I have two questions:

1.
When running v4l2-compliance on a proprietary driver, I get this error:

```
Input/Output configuration ioctls:
fail: v4l2-test-io-config.cpp(227): fmt.fmt.pix.width >=
enumtimings.timings.bt.width * 1.5
fail: v4l2-test-io-config.cpp(386): Timings check failed for input 0.
test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: FAIL
```

Which brings me here:
https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-io-config.cpp#n227

```
fail_on_test(fmt.fmt.pix.width < enumtimings.timings.bt.width);
fail_on_test(fmt.fmt.pix.width >= enumtimings.timings.bt.width * 1.5);
fail_on_test(fmt.fmt.pix.height * factor < enumtimings.timings.bt.height);
fail_on_test(fmt.fmt.pix.height * factor >=
enumtimings.timings.bt.height * 1.5);
```

The problem is that the driver supports VIDIOC_S_DV_TIMINGS but is not
able to apply the specific format just returns the actual timings.
This is from what I know, not a violation, so I'm not sure what the
driver should return if it is not able to set a custom timing. Or is
this check just a bit too strict?


2.
For another driver, I get this error:

```
Input ioctls:
fail: v4l2-test-input-output.cpp(443): use of deprecated digital video status
fail: v4l2-test-input-output.cpp(496): invalid attributes for input 0
test VIDIOC_G/S/ENUMINPUT: FAIL
```

It might be true that setting V4L2_IN_ST_NO_CARRIER is deprecated, but
is that really an error, not better to just have it as a warning?
After all, how can userspace know specific details if needed? Perhaps
checking that V4L2_IN_ST_NO_SIGNAL has also been set is enough, and if
V4L2_IN_ST_NO_CARRIER is set, but not V4L2_IN_ST_NO_SIGNAL, then it
might be an error.

Thx in advance!

Kr,

Thomas Devoogdt

