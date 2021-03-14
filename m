Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B94133A431
	for <lists+linux-media@lfdr.de>; Sun, 14 Mar 2021 11:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234806AbhCNKjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 06:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhCNKiw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 06:38:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D05CC061574
        for <linux-media@vger.kernel.org>; Sun, 14 Mar 2021 03:38:52 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id mm21so61385658ejb.12
        for <linux-media@vger.kernel.org>; Sun, 14 Mar 2021 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=2C3GyjGkSFnx5834GB78tsz/uGvXpHgfd2jsNgOFXzk=;
        b=pLFxqLBmJY/wylQ4Qt377vDU5QU0HQat3fzGvM35h9hcIw/kE7sZjPq0NtNaS3H1yP
         BncKjknSmR1TXiEAdna3ZzEMsGq4s9+3mkdAKWL2AnX4mFdHRXNxWm1cCbZcPxc+W6KZ
         YPQl9fpuda3gIkYSrxkrc28gC622sEtVpExliV+HUfJrURyxEQYWtgqxkJLfzHRzwWq2
         zzYn8o+R1oWo2eAbEFgHJCpA5Ix5K2bPLru53Rp5+T5blrY7k2OXyAbRu+ox6jfS0UJ9
         VGJ8ZmOjhfoCnRHy8UqAeWJkCNqG4/VpwztSkmhbFwN3ldTwQqPJjt+shoqh7mkkLCMX
         FW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=2C3GyjGkSFnx5834GB78tsz/uGvXpHgfd2jsNgOFXzk=;
        b=bm7nINhfL0Ew48OjHVfbjgtym+bLQgCPK5Zw88ujVptcTWBD4lBbn/yYZpost7P94w
         HdHkziq6fe4+JJuH2wwz1yZmiA+rNEUBsj+n4iiGVWvk4W5z0dkDfeMjLC9+DGbsTT19
         kpGnoVuztR896QSU82HFVQTAIHF9qlJG/uF7BD10J8aOo5EpK58NFkOMKcDEGE7uQ6z5
         9Vfn6qTwMHCNrVSbTPKQLzQz+4E+GvCpqo2LPrcJRuKTXfPBV/PWNx6o4bGTNHDbyaMR
         U20ecmrKPoB1NNTXr/zGv3GpsnbR16KuAwuR1Vt3eGJC7vZGWCU+inpMJ3GLkjazEgMU
         1g6g==
X-Gm-Message-State: AOAM530xrq4qLBagl+y4hRwqnh/mfonhJpRvqPQjMna8AmjZ2fvgWOSL
        WzM3WouhTZvebfhzayf6pL7uLM2pQDk=
X-Google-Smtp-Source: ABdhPJy/59xXmxUQc1hk1QB33y9UtzvfXOgduy7tunN8wZP+89A92S3VAjGS8aTfnCJoO90iAj/Ltg==
X-Received: by 2002:a17:906:3c18:: with SMTP id h24mr17908936ejg.435.1615718330572;
        Sun, 14 Mar 2021 03:38:50 -0700 (PDT)
Received: from [192.168.0.29] ([5.77.81.118])
        by smtp.gmail.com with ESMTPSA id q20sm5528302ejs.41.2021.03.14.03.38.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 03:38:50 -0700 (PDT)
To:     linux-media@vger.kernel.org
From:   GhostWriter <articolistaghostwriter3@gmail.com>
Subject: driver mancante
Message-ID: <75ae71bb-94f1-3a98-160c-74c927610bc3@gmail.com>
Date:   Sun, 14 Mar 2021 11:38:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Salve, scrivo dall'Italia per segnalarvi che manca questo device-driver: 
046d:092f nella vostra lista.

Grazie per l'attenzione

