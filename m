Return-Path: <linux-media+bounces-12209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A358D42D6
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 03:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB3311F22DBC
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 01:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2586134AC;
	Thu, 30 May 2024 01:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKaDAN/1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5D16AB8
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 01:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717032346; cv=none; b=n1lQALOeZuzcwQck2A6E+Z4Ygx/pnyyWkxDr45O/e7CmDYSfwrHibYb8vW6VnNTeH5GsdiMtdVjsFu+ENeeaz4zSbcM9tWIjOmDul+xZS8e8ARUj/t4m0gBE4FkSzKETjOosar2vjuO0mT+7nTR0uneWjovjZmMa/h0zDeN12aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717032346; c=relaxed/simple;
	bh=1smZDnG8XmH55nzpq9QZJuwuiaA6hGUVW53zy0zxfcg=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:Cc:
	 In-Reply-To:Content-Type; b=R2Gy+Avn67GN3J46kmLUmZyuo37r1KBavwND9JkjAcyuQoAeJ4Z4dGdTK2POyiLrZVYzDfeT7wk2NzK1ejyO1hKufLwBduZ0NCQX6fFcNa1MiFhvHjz2CFcEIREpQ0BqkdCCoQtuxRQvB+azy7Jz9gBfqHb0ffklhw8YieGNqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKaDAN/1; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2bfffa3c748so266871a91.3
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 18:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717032344; x=1717637144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcgcuesWViQCQqXVJ2+Pzo6Qyc3veftU7OoB3aeCebs=;
        b=HKaDAN/1CTVcpR0SZgqtuGqOLXJSYwuluFdQzXuGLkjfkUzjY0+Ur+uTh/mAMm/4wu
         QKONT5R3U8Ob+j7goHgGrcF5nHNgq4R3AvI2XkLr9wnNtN4+X8s1jwvD7Wo7BdDJ+Sfm
         XtkrbRwm29LpE0ZmC/LACPOHTuvRHgAxjyh/IlZtVsnQv2VHrGQAyDVDbPU+bfT38Wvh
         1hnnOyCc/Ocu2L0o/vzHvvFC8bHLTmcq4PLNKuc9wSy5i4bsdCUKmT0KAZo9ZVNebszd
         tIwymoKh+cwWxE4deHqXyf2x6h1VFxHm6EnmyVrLZQs3xAzMR8As5k0l2kXTyP00OKLu
         5Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717032344; x=1717637144;
        h=content-transfer-encoding:in-reply-to:cc:from:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcgcuesWViQCQqXVJ2+Pzo6Qyc3veftU7OoB3aeCebs=;
        b=W170rzZ12IqiPhXvsu+gbefaBHSTBWtI5wzk+2cQRWrE5hj3RcMEygHrl+R7cG94EI
         90p9XhIQ0wGx/MBE4QBzLDGL3XCcMSUOkyJrQzz0n3TDiYYOKwjAZJDenDCZ0M3Un4no
         10uQs1XPipl7RaIzzxoNJz0KmfpdaNAEx8z5IRYCD8kJZknoNq9b+AGG3TS7yQXOBhn3
         hvXya5/esvOeWBQWbaofRu6b/p+GxT9FZXI8t/I5Z43w71iHVowthxCtJX827N9SJxOV
         XsYuGkCBLKX/p0e0A/7a/oepUtdfCZ/0VqArBMjektvKSsvlpwkpW3QKyoIIF+npSAUa
         qQ2Q==
X-Gm-Message-State: AOJu0YyIUJ3JuVE3LFgm5GFumwO/rv1F49ZP11T5+lMkBFwjP0pUGsJb
	qORMzc2QDy27E9OzRCmns/7k3Wmw0NP/LByXlcNkaeWe+/M2ROoc
X-Google-Smtp-Source: AGHT+IFw3IwNOS8xrVg0Ej1kZf3F1q6SB8v7jR7M0CRB0plRjXzS1iLbem7iMu7sKsFWmsfnid4tyw==
X-Received: by 2002:a17:90a:a088:b0:2bc:9bce:d65 with SMTP id 98e67ed59e1d1-2c1abc4b9a1mr777625a91.43.1717032344001;
        Wed, 29 May 2024 18:25:44 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a779e937sm481862a91.38.2024.05.29.18.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 18:25:43 -0700 (PDT)
Message-ID: <456dfb99-83ce-45a3-be42-6b951713ff37@gmail.com>
Date: Thu, 30 May 2024 10:25:41 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: media: docs: build error of userspace-api.pdf as of v6.10-rc1
Content-Language: en-US
References: <bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
From: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com>
X-Forwarded-Message-Id: <bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jean-Michel,

Assuming <jeanmichel.hautbois@ideasonboard.com> is your past email
account, forwarding a message bounced from
"the mail system at host perceval.ideasonboard.com" as "Undelivered".

Also, I'd suggest you to add an entry in .mailmap.

Thanks
Akira

-------- Forwarded Message --------
Subject: media: docs: build error of userspace-api.pdf as of v6.10-rc1
Date: Thu, 30 May 2024 00:12:43 +0900
From: Akira Yokosawa <akiyks@gmail.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

Hello Jean-Michel,

I tested "make pdfdocs" on v6.10-rc1, which ended up in a build error
from xelatex:

    Package tabulary Warning: No suitable columns! on input line 48770.
    
    ! Extra alignment tab has been changed to \cr.
    <recently read> \endtemplate 
                             
    l.49179 \end{tabulary}
                          
    ? 

I know this won't make any sense for most kernel developers.

So, I did bisection for you.

First bad commit is:

    adb1d4655e53 ("media: v4l: Add V4L2-PIX-FMT-Y14P format")

and reverting it resolves the error.

It looks to me like said commit added two columns in the flat-table
of "Luma-Only Image Formats", without updating hints to latex:

    .. tabularcolumns::

above it.  This results in wrong column count in the output of
Sphinx's latex builder.

Please update the hint for the additional two columns.

FYI, you can test build without building the whole tree by saying:

    make SPHINXDIRS=userspace-api pdfdocs

Otherwise, you will need to wait a long time.

You can ignore the extra warnings of "WARNING: undefined label:"
and "WARNING: unknown document:" due to the limited scope of
documentation.

Regards.
Akira

