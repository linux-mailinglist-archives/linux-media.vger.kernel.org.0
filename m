Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25195175DD3
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgCBPE0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:04:26 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39196 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgCBPEZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 10:04:25 -0500
Received: by mail-lj1-f193.google.com with SMTP id o15so12109723ljg.6;
        Mon, 02 Mar 2020 07:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OsxgYgsKphJDyuRREvQcBCxW+LOMW9YuhqtTDzyIanc=;
        b=sR5HyV6oXBFgipsb3ANiMlO3m5ZKXcTJRG44spcXmrm3FDiSyFsOPjc1oCYcz0S4+q
         Zy0/Wy3Vyznt+BF7js7FKTYwQHUP6+u8VXht705SHRioh9qBs0fxgZK6fMpyHC6E8Icq
         6jKE8GIroACzzGUyBr/hl9Ku0PBXswtudX1McI/vS0QunxqBkUqjO4ajROAj8u1PFGWT
         KbJdJ1I/m6E/pfW1Tbv97cXQPFOI9R5qxrZb1Meo2e7t6yhSl7cuCAV0HiDS/mafPBti
         pHMECofq9Qlgc+n6zvkJOfqkIxm+JrvidRotdWKWwJMZ+HszfSo9YLgka0NB8ZC7FQSK
         FERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OsxgYgsKphJDyuRREvQcBCxW+LOMW9YuhqtTDzyIanc=;
        b=H7Nc338xnCeRcp/R6GyxmtIrO5gr0UVEPYfjd+6c7pci5hVCzrHJ+/mRewYbDcnGlc
         TA8Pa9hJHwT39xp85a9lexnUuyNYmn0NdfKQ/0P8PgGbB5kR1n08kKlwFuMsSlzU8QHo
         /wh77SgN1unRmxz3uCCSx1+BmkmOgUbwPMW+KMXdQO4dp51q7L9D6ouWIGraRrxXbF+U
         wnkkwGjT73b6cnk6plDzSCAMjLShL4S59LnUOoTlVv3tURqEG1UWPEl7lj0R0NnWMfdu
         ZQDIP9PaBXa1MvSAYts+5m/W4qGyaPrEJPjKu3WJR/nwDy/icbTNxbF3TPiFrxSAonYr
         KOmQ==
X-Gm-Message-State: ANhLgQ3bJkXl1h8656zSKrqcmdNHYYM+ZGgkkmaSg+aNQ3rrn4EAJMvk
        P9DiGmHudI6EZNzJyM+yaFGPcvlv
X-Google-Smtp-Source: ADFU+vtiyeT++BmeCxJab16/JiA7Sq6GAi7V95VfEd1lChxPAqxfx6XOoQi/iC91aKCTY3perxTq0w==
X-Received: by 2002:a05:651c:2c9:: with SMTP id f9mr4667824ljo.85.1583161462499;
        Mon, 02 Mar 2020 07:04:22 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id r15sm11141676ljh.11.2020.03.02.07.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 07:04:21 -0800 (PST)
Subject: Re: [PATCH v1] media: staging: tegra-vde: Use
 devm_platform_ioremap_resource_byname()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20200227180915.9541-1-digetx@gmail.com>
 <20200302080456.GD4140@kadam>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d748bf2c-e38c-dabb-59ad-39e14813e40a@gmail.com>
Date:   Mon, 2 Mar 2020 18:04:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302080456.GD4140@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

02.03.2020 11:04, Dan Carpenter пишет:
> On Thu, Feb 27, 2020 at 09:09:15PM +0300, Dmitry Osipenko wrote:
>> This helps to make code cleaner a tad.
> 
> Please don't start the commit message in the middle of a sentence.

Could you please clarify what do you mean by the "middle of a sentence"?
The commit's message doesn't sound "middle" to me at all.

> It looks like this for some of us:
> 
> https://marc.info/?l=linux-driver-devel&m=158282701430176&w=2

This link points to this patch, I don't quite understand what you're
trying to convey here.

> I generally read the subject or the full commit message but seldom
> both.

The commit's title describes the change briefly, while the message gives
a rational for the change. Usually reviewer should consult the code
changes themselves for more details.

Do you have some kind of a email filter that shows only the commit's
message? Otherwise I'm not sure what's the problem.

> Otherwise the patch looks very good.

Thanks
