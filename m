Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65D4B731B5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfGXOdY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:33:24 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:44459 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfGXOdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:33:24 -0400
Received: by mail-pl1-f169.google.com with SMTP id t14so22061971plr.11
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 07:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=o2b/M+I9BbhdegDZkBWo+NyUJvKTNf861YIINqI0cCg=;
        b=no1KsZOTjPXOQdhfiS30EESYIIgAFcNy0Ld8G6zUyCxZ/1lWBGCcsV4Qq4sH9R2Oh+
         HNvJin6Z9i01kiBvfJWHKbwOIUCVVtD0HVhghlckYicMIcYYueGjNphcj4NrytX2CA/C
         5FZMl+Keya9EHfLFC+SYmSrjX9ShQg+/4j5746+SMfMiygxjyqNuXdGWPLHLM3mUZsFj
         zjwe3fuUtyO6/FJL3NtKz6PVgvExeNqLjNa+wVy6lyRCAnjRksQw6MxvaQqyucqCuz7e
         0UNsgOEJT20zlH2BIn2f6usgPsGPY1Cjy3gNUopemu77Y1cG017IVLSSwXThL0aPu6ja
         eftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=o2b/M+I9BbhdegDZkBWo+NyUJvKTNf861YIINqI0cCg=;
        b=fgTyX+A8Si5Y4MsJGzGdjV9m8R8MhVi8QMjg2TAw9CMY5Vt3XmHIycC0UNHM7J4hpV
         /1nCSuZsaF24f3/cy/uu3g1rkbIx3e6UqPqA97RXwOZY89hupLn81+ZwaIWLY+sAe7jI
         qZzuv3Pu97AT8+Daum+Zi3tjtm2JyFXx9DbV6uVxl4I2/BwrNXHu+YyDzPRnOQ7euwMh
         lkPckHIfyz56DmMonvF9QXvTmQZzBYAyZuRE3CG7vLA9HHi71cJg9FXXnZtY2FYHQ7Dy
         44PlVjprN6+xyQFAOJZtVbzYfabQnayVtHaWFQ2YFvmnrCmTtvLp/NpegqCI1j1evRQZ
         zdkw==
X-Gm-Message-State: APjAAAVFdsJCqtwdQ8UNP91JKEcBT2EVoWmT00Pv2HOrBaRN+zOAhRNS
        FYwML15J+PSOM7nzVfhar2p29c26UaY=
X-Google-Smtp-Source: APXvYqxr0aCN/TH9+RVBAipnhzA0KCJu9nDRgG8fOYWvArEEL8hp+cyOu4DenbSFi85s+mn0gJsE7w==
X-Received: by 2002:a17:902:bf09:: with SMTP id bi9mr80800182plb.143.1563978802832;
        Wed, 24 Jul 2019 07:33:22 -0700 (PDT)
Received: from [10.0.2.15] (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id l25sm57434180pff.143.2019.07.24.07.33.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 07:33:21 -0700 (PDT)
To:     hverkuil@xs4all.nl, ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?Mark_Balan=c3=a7ian?= <mbalant3@gmail.com>
Subject: my patch
Message-ID: <7aa628b3-aaa0-950e-7872-89b27c4bb522@gmail.com>
Date:   Wed, 24 Jul 2019 07:33:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I hope it looks ok? I was only able to direct git send email to send it 
to one recipient (Hans). I'm not sure about the value for "pb" (I set it 
to zero by default). Please would like some feedback. Also, I could not 
figure out how to use git send-email to Cc: linux-media. Cc'ing was 
working yesterday. Sorry about that.

Thank you,

Mark

