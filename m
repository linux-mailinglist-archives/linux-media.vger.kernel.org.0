Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4E1A7008E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 15:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfGVNHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 09:07:30 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:36237 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbfGVNHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 09:07:30 -0400
Received: by mail-lj1-f174.google.com with SMTP id i21so37555620ljj.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2019 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:openpgp:autocrypt:cc:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=81PFJRegZoIUE/QxUE+xDddONniv3UoJCZAdRqDgRmA=;
        b=lAWCb3x+t81vvH/cL1qMsL2UUjI9gqhvik620jvQHU0YK8SWk8qb7SV7vpgHA5/d3C
         VLqlaBrOP6RT8frN0E4HbNdBdGXlF03NI+uNZjFUnzHhwjHJfGK35Ewm5DP0/G5DjPub
         6jnhxXtdmLNhwTBOKyazR1utolshqswoLwET7Z58Dnth69lzMvaZ2uR0pMONAvqq0Agt
         NiXI7a/JMZNwsAIPc3nAlhEclST14DT3gBeJliQYC3NXsfti5m4rTB9DIPMg3Ni50TyK
         LFLRPWMsq4Nvy743D6dTWI75QecTVq4crQD1JD+NtXfZM/saBPpHDq6RYzxu8DMtXXP/
         m0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt:cc
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=81PFJRegZoIUE/QxUE+xDddONniv3UoJCZAdRqDgRmA=;
        b=gYMJd1SbjLOzTneqNoNrAXpbncHO46dhIRDwxKNPHwbGWw3RFLmJ2kTcK9mXSyFXJQ
         Vw2571sp8hyhJ9je937AOGHg76j7flwh3wwn1s+pu186cW/r1qA3FVUzINHnHE+KOeZq
         8/LGuWBbYSiO+RGswFJak1WWjjl/msU2tum7pwLo200VMXM5pHAtUUyouvjhHZjCPxuj
         d4nC56lqoqh5P6iy3NVuQZ+kbdXURI7EA3jo3NtapTpo7W47HhIp/BlVtTl6hRc6kkyb
         KB/MDNxTElXgXnMsSaeP01idc0wpShQMNo6/nVJmSqXsUWnB/gMWmbRQ27pPoEsC1EPB
         94Gg==
X-Gm-Message-State: APjAAAWLHBDdjcKUBqGv6BYPGIlCYUQ8YQZdaqPaYaqQ9N6zIKaq+oMG
        m8ls5UnP8VneVy+zeiKZBTeffTFThdo=
X-Google-Smtp-Source: APXvYqw6oV6xwIeJA/kPev7f4gmkID3PpYf1Ex5Z1a4Q4srbh46TeE8T9yRMYHUXG870+EXWdqsPJA==
X-Received: by 2002:a2e:988b:: with SMTP id b11mr35844599ljj.110.1563800847268;
        Mon, 22 Jul 2019 06:07:27 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id q1sm7504067ljb.87.2019.07.22.06.07.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 06:07:26 -0700 (PDT)
Subject: Re: [git:media_tree/master] docs: interconnect.rst: add it to the
 driver-api guide
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <E1hpWim-0008Ff-Q7@www.linuxtv.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Cc:     linux-media@vger.kernel.org
Message-ID: <19f6ec1c-9ae9-db94-6080-37d751dd5d22@linaro.org>
Date:   Mon, 22 Jul 2019 16:07:23 +0300
MIME-Version: 1.0
In-Reply-To: <E1hpWim-0008Ff-Q7@www.linuxtv.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/15/19 15:20, Mauro Carvalho Chehab wrote:
> This is an automatic generated email to let you know that the following patch were queued:
> 
> Subject: docs: interconnect.rst: add it to the driver-api guide
> Author:  Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Date:    Tue Jun 18 17:15:10 2019 -0300
> 
> This is intended for Kernel hackers audience.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Reviewed-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
>  Documentation/driver-api/index.rst          |  1 +
>  Documentation/driver-api/interconnect.rst   | 93 ++++++++++++++++++++++++++++
>  Documentation/interconnect/interconnect.rst | 95 -----------------------------
>  MAINTAINERS                                 |  2 +-
>  4 files changed, 95 insertions(+), 96 deletions(-)

Hi Mauro,

Maybe the script that generated this email can be improved a bit, as it does not
show the renames. So the diffstat here looks a bit different compared with the
original git commit:
https://git.linuxtv.org/media_tree.git/commit/?id=9b1f44028ff2e051816517781153e10a2d748dc3

Thanks,
Georgi
