Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2AB7DB58
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 14:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfHAMYZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 08:24:25 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34362 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbfHAMYZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 08:24:25 -0400
Received: by mail-qk1-f193.google.com with SMTP id t8so51805683qkt.1
        for <linux-media@vger.kernel.org>; Thu, 01 Aug 2019 05:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silverblocksystems-net.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0fBH6l9BLYbOCzrs817yKQIIa9zIlv8DLrTZC4IffaM=;
        b=RSLcPoaeJAAfB67bUYIqah/OaGmFpMbgJwj7DV167LybGd7QKyr8uQMAQ5hbwPP5fe
         oDVhneA/BOjmAHr8YDUq6d4XcMhrqAnpK4A5/Ly5Oj3y3XkcS+4C+OuOqyoRREuQJ2Jw
         +G1n1TNnBpvr2TgvlgvNy3eXYmhsaCCwtoE/s6gz2LkDZCqv+R9fgqCd8nTUg/rFi5q2
         /lXNMgdJfU+3uxbjquwY05kN1LBZlSgte1TIJ71mQwqhi2VrOXSVR+Chx1kEPupNzUUJ
         kEqvfuj7W+9SjYdrKiOMb3QhAqZqHZM/PCqvNMnPba7g9hQf6t2zs/ZG95arhXt0cFRF
         QS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0fBH6l9BLYbOCzrs817yKQIIa9zIlv8DLrTZC4IffaM=;
        b=af/F0oEFGMEFdrCEh9tP6fxjw0d0+phj1MWoHxl2Oof3z8CPs9/oraPbuGF8tAIPrm
         JoLY8yY1GXrFPgdIaT9lFEl3+wjdCfgKsGJBJ+ctxocDDwImuPfgzGtRfXar3gRJ/fmL
         oqDzMl78Iy/kbeyIDR+KI5CdwDvU0Pj1Kf3aruGEsILIKM6NorabPwhVAgkNk33p7D8+
         AGxJaw4n2HZ+1BUdlusVY4oqs74FK6gGUNyTNA5OMczugzsPZ95xbx6zjDX4520wzMZh
         x8E0Ay6DNw1AhYHk3eMqzEGmzJydDNTQo7sxYd/Wfo8hzu+k4HPwE1YPobKmyZmS/kMZ
         4DkA==
X-Gm-Message-State: APjAAAWfCdHiRZo4LVwSR21ep/22HuAkNP/Oc6K1tYoCK2M5MwprrkHL
        +LdfUQPfW5ybTvdJaiYR7cvLZMa1
X-Google-Smtp-Source: APXvYqzkeNPzSavZYxUiinFMf15Rmke7hDUbYCslQnV5GTuD3Ej7QWvc13oXJOLjhttmRXoNhgIpfw==
X-Received: by 2002:a05:620a:1310:: with SMTP id o16mr1144022qkj.196.1564662264096;
        Thu, 01 Aug 2019 05:24:24 -0700 (PDT)
Received: from localhost.localdomain (static-72-9-14-85.md.cpe.atlanticbb.net. [72.9.14.85])
        by smtp.gmail.com with ESMTPSA id r189sm31309054qkc.60.2019.08.01.05.24.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 05:24:23 -0700 (PDT)
Message-ID: <7970f0e30d1eb83e7067225d07b923863bf1ac50.camel@silverblocksystems.net>
Subject: Re: [PATCH 4/5] media/ivtv: Reduce default FIFO priority
From:   Andy Walls <andy@silverblocksystems.net>
To:     Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org
Cc:     linux-kernel@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Date:   Thu, 01 Aug 2019 08:24:22 -0400
In-Reply-To: <20190801111541.858088180@infradead.org>
References: <20190801111348.530242235@infradead.org>
         <20190801111541.858088180@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Peter:

On Thu, 2019-08-01 at 13:13 +0200, Peter Zijlstra wrote:
> The ivtv driver creates a FIFO-99 thread by default, reduce this to
> FIFO-1.
> 
> FIFO-99 is the very highest priority available to SCHED_FIFO and
> it not a suitable default; it would indicate the ivtv work is the
> most important work on the machine.

ivtv based boards are legacy, convential PCI boards.  At this point,
these old boards are generally installed in boxes dedicated to video
capture (e.g. MythTV setups) or boxes dedicated to capturing VBI
information, like closed captioning, for business intelligence.

For boxes dedicated to video or VBI capture, the ivtv work may very
well be close to the most important work on the machine, to avoid
dropping video frames or VBI data.


> FIFO-1 gets it above all OTHER tasks, which seems high enough lacking
> better justification.

I agree that FIFO-99 is the wrong default level.

However, in my opinion, threads responsible for real time data
acquisition should have higher priority than the other kernel driver
threads normally running at FIFO-50.

How about FIFO-51 as the default?

Regards,
Andy

> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  drivers/media/pci/ivtv/ivtv-driver.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/media/pci/ivtv/ivtv-driver.c
> +++ b/drivers/media/pci/ivtv/ivtv-driver.c
> @@ -738,7 +738,7 @@ static void ivtv_process_options(struct
>   */
>  static int ivtv_init_struct1(struct ivtv *itv)
>  {
> -	struct sched_param param = { .sched_priority = 99 };
> +	struct sched_param param = { .sched_priority = 1 };
>  
>  	itv->base_addr = pci_resource_start(itv->pdev, 0);
>  	itv->enc_mbox.max_mbox = 2; /* the encoder has 3 mailboxes (0-
> 2) */
> 
> 

