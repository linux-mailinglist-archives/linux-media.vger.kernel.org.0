Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20E2678FA6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 17:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388171AbfG2PnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 11:43:09 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:36655 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfG2PnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 11:43:09 -0400
Received: by mail-pf1-f179.google.com with SMTP id r7so28239798pfl.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 08:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:user-agent:mime-version;
        bh=A89EEe1/US5kg8pm2EdCQcHd1Jx/JLFX2sqJ5EW+2Z4=;
        b=lHV/GBiAVPfOAUFYWoT5jc6omvyzDJnavbD913qjWKQhVR8PyjgOc4h3jIW8EzznhQ
         /EHF44aH+Cv+v5ApZU3PUoWdOxlQKtRKTjy9xZZczjG4V8IiSLdXARb0ut7Wy6D9W/OG
         cMtZdsSR6+D8FzqzjTQTHiLWexPnAQ4JJa9coYL/Jyf4oEZjQH0anXhBkJInoE/OVLr7
         RHnRahfLLgKAH53Pa3HFaLwYZnMOKahvu2KR4rTJZ8CfwddcMpGXeNTy3BjxOR+X901k
         XHouYuv7mh0GEBYvREbbJCmyweMDyK8AVnTG+OVGV9Z39gwYUdcHLy+vWb0b1GKl3V1o
         j8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=A89EEe1/US5kg8pm2EdCQcHd1Jx/JLFX2sqJ5EW+2Z4=;
        b=Ko9j6RwUwrYzQWHJVnvS5U6amU/HTDkgcacHSf9FGSCnMrESqWJXL4z1cJuXJu1uYU
         z/QcGbEdTfn/yDReTWK6D3q8H3EynJQysl6SMSUrYFNOAeQmYAX/4TuaIgck4J+5OTgg
         4jaqIzkfs5m9oG5Tyrff4gz6LuJm+WJ1fOAYlnDgoCPqhnJBCbaE7jNRnZdGk4szQ3d5
         st3mS+o6+S7UHZAmBijlIsItPtu6B0Wa9vqF1T938Sf6FleMq0sDTPlb/7vlpTCSgNt1
         5AdQbN6okMDbQcM/v83PH/mDtaTMEOOH//0uRCuXqUGPpe4RRG6FxpEW+OTskd+U+Ckt
         E2Rg==
X-Gm-Message-State: APjAAAVl9tmJA8vw24WBL2HB7l5mcmMCJFFUJ/0wD6sPmCbDGjOvkrsp
        EG76PBNDNBj7OjV7OnmPryo=
X-Google-Smtp-Source: APXvYqzXQOrNa+iEyjM7nxt7ljnBsYGSGXJLu8l2eRyHlLB1Lw7iWXhGYs87iU/yFczNCSH+hCT7hA==
X-Received: by 2002:a17:90a:23a4:: with SMTP id g33mr115920380pje.115.1564414560999;
        Mon, 29 Jul 2019 08:36:00 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id z12sm43490680pfn.29.2019.07.29.08.36.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 08:36:00 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 08:35:56 -0700 (PDT)
To:     hverkuil@xs4all.nl
cc:     linux-media@vger.kernel.org
Subject: tw686x driver (again, sorry; I respect it as a good driver!)
Message-ID: <alpine.DEB.2.21.1907290834280.47996@mbalantz-desktop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-683466979-1564414560=:47996"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-683466979-1564414560=:47996
Content-Type: text/plain; format=flowed; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT

Hi Hans,

I recall us agreeing that a custom function to free the last resources 
attached to the video device would be preferable. So may I clarify, in 
your words, what bug I may be fixing? I please need a description to 
report to patchwork and to my mentor..

Also I¢m getting confused reactions about my patches from Ezequiel and 
that may owe to my lack of direction on the fixing.

Thank you very much,
Mark

--8323329-683466979-1564414560=:47996--
