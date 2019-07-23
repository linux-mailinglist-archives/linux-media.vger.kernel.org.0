Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E15971C52
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 17:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388579AbfGWP5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 11:57:49 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:37023 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731538AbfGWP5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 11:57:48 -0400
Received: by mail-pg1-f170.google.com with SMTP id i70so8900017pgd.4
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 08:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=WzxZ1dsK6SW5mSevbaJcp1vKKjpp0zdg63udyVq/AuU=;
        b=My9IrY335bY1i0LarDG4N6rBoV6POzekAryAmI+7kGjqbwsZiTNcxVC8ME4IAJ9Rau
         Ku2hr5WRTr6ic2l+NP8iUlR8vWOi8ppvHhumXSbpfkdIMqedo9blFx2kfq1q8MMRu2py
         FG4h3+bt5QS7WMnfJMAW2wxSYO3K8JCmaGtZiTCVZOZtEJrv+yIsHnoSeyx1XrwfAg1p
         FbzvwNZcvGz/dFqQhTxWnnzXLi/ESAvfNgdfQTjHhNdan2xtD3h1mNiMEBHpP9FGGSLT
         eIpwH4zoj5cP/tY5HKcqAuYbYTkTarS+6IuuePJIPmwekNQI9eeY/2+r5werCSkfSe5C
         ClnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=WzxZ1dsK6SW5mSevbaJcp1vKKjpp0zdg63udyVq/AuU=;
        b=Cwch9xamoa/nRXIFcheVKW1tVBVheJU+rPl0DxrICjagDlsB/3tAOxeVxCoZyKM6pK
         35772xWjsZO8JXOEQi5mg/eLk+kQ2iM4043u82J+voFhnqtUCH9PQV40gk2yAIPAa14O
         FYOOqpo3w/E0ecWzLAUra2wFUjx9ZFnYyXH6lo+LwOaMtx3xvThKVaPFO2hMtmvyQsCe
         PU1MbUGO1HFLcrRRLkl3Ye6a7L99ZkwzircLQJb1QP+p3F++jaODxuHTEdy500V8OpZ1
         aDh9jfZgTRyaBO8V16lK4YLgKLBALE5Fw4161epT3CP1Z+/X3yWRDmSF79hwOV0tfCDe
         tWcQ==
X-Gm-Message-State: APjAAAWFcxf480NDH4i2zFJx+pRJXFMW4D/DPDd/eH0q6WGO/RhnsAFo
        5wg/wXoKPeKWN6MDyk5BSkLI1BWDx4M=
X-Google-Smtp-Source: APXvYqw4BYkBa9/uD8YlVWyEkQSHzFvcQC1z0eQvG3CszIjx3dtxcS3ng0OhxjnHGZ1o3abYgAlFog==
X-Received: by 2002:a65:584f:: with SMTP id s15mr60720998pgr.175.1563897467360;
        Tue, 23 Jul 2019 08:57:47 -0700 (PDT)
Received: from [10.0.2.15] (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id b29sm74881727pfr.159.2019.07.23.08.57.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 08:57:47 -0700 (PDT)
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Mark_Balan=c3=a7ian?= <mbalant3@gmail.com>
Subject: tw686x driver (continued)
Message-ID: <a62ed447-e013-d1f4-3f28-c6a673fd0b28@gmail.com>
Date:   Tue, 23 Jul 2019 08:57:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

I don’t know what top-posting is and I had to delete the continuation as 
linux-media kept flagging my email as a virus, but I take it that it 
means I should write my email below the previous? Anyways, I’m working 
with a linux driver verification team to detect race conditions in the 
kernel. Using our tool, we detected a possible race condition with the 
tw686x driver. Even if there’s the slightest thing I’d like to please 
patch it as I really need this for my enrolled program.

In any case, if interrupt handing isn’t given dedicated functions that 
are called before tw686x_memcpy_dma_free, I wouldn’t mind writing them 
and including them in a patch.

Thank you,
Mark
