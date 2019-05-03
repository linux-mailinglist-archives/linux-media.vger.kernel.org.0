Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4005C12EAC
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 15:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfECNCF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 09:02:05 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:51142 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfECNCE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 09:02:04 -0400
Received: by mail-wm1-f47.google.com with SMTP id p21so7012784wmc.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2019 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g3c7OKIVczqhKOGlBfNwksurCXXkiSq3jBwzZ8DT2No=;
        b=Qn+aSydKmolv/bqxPOTYJRa98hMyuctTBk3ZIe7cYDg9upcAwiCWRNi7PfK52qBxIS
         eew7n8ZG6k1vvTaRTK9bZd1sDVHQ5B9xsWdn5LjUHV8i6Z79VlcOxZj8P6uMECSlRo0Z
         ZhTo/PO5tmHSkbKG+zqJYPTGwKcuWgM9ksejaOlRI/TlZIrT0YpseBjjpEGjk08+T25K
         v6aB6xmILrVO0Tf+hfA8/ym0hJcj9Qj5WH0+y928ZTsH7vidq9UXNcMm78K9PMQVlK+R
         LNQvCPTXlUzuSP7RX8sPHhQGUBztX0Y0Wmrd6zXUW+P1zjB9uVnxCSG/zMFMWGQiZaoY
         aowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g3c7OKIVczqhKOGlBfNwksurCXXkiSq3jBwzZ8DT2No=;
        b=SCgvsPPqn3PwGdB+XZn6zsoc031y9Qr14g8ceuSBZ/WtwRGYiOwTPGpy4XzMTregtU
         SawceFQYNLLrDTLLec6wwm+4sr2JGPzDm1pVu1Y39WiAZrkTofcBp17aK98MY+liZ2+m
         dsVlLixB2vbX0BBI2ZCF2RFkrKW76uA5uqutdINX4d5kMokSz95YHjLrp2x4YySovKkZ
         j1YShr/lSRU+cObedZAD5pdwlT2T65Mc7gM4JcjZxEzs+y5Mhk2omuqNXPSAFYiLvw8Y
         +VLK3sVGYAw4cgjIfAjcP7AdJ0B5HP6SQShEqV/gcFNyBMTSsGpDv1xAOdn+nMyTKYia
         e57w==
X-Gm-Message-State: APjAAAUQzZLSWaSpm54osO3PjQPt4dnIuDYreK8fPU8OTaskYSPULBhv
        pVqOCKdKfVZhIGFmV43IcAXc5Sj6
X-Google-Smtp-Source: APXvYqyo4dfE01AXsPC00qqoPJUdSS4W6nAGogcsQkkoPWUSkOK2/0zf+hWtNdxF8Tf+1qrjy9w+rQ==
X-Received: by 2002:a1c:1a85:: with SMTP id a127mr6188693wma.139.1556888522892;
        Fri, 03 May 2019 06:02:02 -0700 (PDT)
Received: from drswgregorj02.drs.expertcity.com (ent-nat3.drs.expertcity.com. [78.108.113.8])
        by smtp.gmail.com with ESMTPSA id i8sm3177790wrb.5.2019.05.03.06.02.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 06:02:01 -0700 (PDT)
Subject: Re: [PATCH v4l-utils] libdvbv5: leaks and double free in
 dvb_fe_open_fname()
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20190317163220.1881-1-sean@mess.org>
 <20190426121344.510ef576@coco.lan> <20190426124217.55ae71cc@coco.lan>
 <CAJxGH0_bmRiGKCtOf_jFZh_wVsyKR4s1DoDcSvYF7UYx8JNS0g@mail.gmail.com>
 <20190426154917.75adc64a@coco.lan> <20190503100036.047693d3@coco.lan>
From:   Gregor Jasny <gjasny@googlemail.com>
Message-ID: <77edec73-57a7-62ed-cf93-d5fed473b5cb@googlemail.com>
Date:   Fri, 3 May 2019 15:02:01 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503100036.047693d3@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 03.05.19 15:00, Mauro Carvalho Chehab wrote:
> Are you planning to release a version 1.16.6 any time soon?
> 
> I could likely do it as well, but I would prefer if you can do,
> as you know better the drills. We're still receiving new
> complaints about this issue at Kaffeine's BZ. Just received
> another one today.

Yes, I'll do it over the weekend. Spend the last week hiking in Austria 
and had to catch up at work.

Thanks,
Gregor
