Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5591361FD
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 21:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgAIUwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 15:52:45 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:39025 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgAIUwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jan 2020 15:52:45 -0500
Received: by mail-qk1-f194.google.com with SMTP id c16so7375866qko.6;
        Thu, 09 Jan 2020 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9dV4dltXerlwubIciikJuPDN6M7ksl3lmWUD+DcQSTg=;
        b=CegmGFs8q4AP1mQyeeji7+3hgq2VcMn2QGsuDntbXnAa214OpfPAc0o7elnATVTxXQ
         zab7secdAAX5OwmHi8W2k8wviitZ1cjYXRfZCS8MIHx8/rRUPROBqRPlYv+mhu3s2M6o
         vvEI/S2mwSqd1tSLL2VA2O3iqvHLRM2vi7LpED38t9fnoJd+pkbNuMyswgNhGF2TxuS6
         KrlMMOGgw3SpwQSJDwcJDXPlK04zlp38MUvjhtahIexQjnRpa9VR/1OljVdFhS6wAsHA
         BqQHAdcfDaLQWFemRRMgzK/X+8jvOqB9rl35PFu1ap2QcY5oc6rMM+OjDyyDJVNXnKQ4
         v7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9dV4dltXerlwubIciikJuPDN6M7ksl3lmWUD+DcQSTg=;
        b=L13mrT2NI3mn6PjA7u1TGQLFjt/xC+ZCA6pA+GpcZogpI4MDW+kCMdic/J6QCI1oyM
         xS1Na3vURzicsx4lKFs9yxopSKh5NxxK60yCfU+gTnVSmJYpzBPhC60Y19VzA/LwzXwW
         YGjBJ0scyinB3OrMuAGlDJ7Ej3fHcKsqwMPzE/z/Hg0pSpgtUjmGvY8Z5E2WaOUzJhgd
         aOxSsCLkkIEnujoE9r0HhIBGKNpx6TxsIeG0Ja3fnR34GnZwPN5QVh+aAi/s27+/Th0L
         oJNT2/Sof32SAN0Jpos2LspM7tl4CJkMsemIMeo1nQQi+RWDWl/Q1XtmlhB4ajVStD/b
         nw2w==
X-Gm-Message-State: APjAAAXvApk0B7aTWVLBAHfjwR5YkGhTD/twbtcuW93Ev/LqNp1wIDTY
        M+p98JdTJ7ydmx43PaavxpM=
X-Google-Smtp-Source: APXvYqwMvl3bK+bLNhZbPmGK4nsePikAkTT0PWSf1e7tgtdAghfWRALxnrt23WIFx+pTYBkbzDk6OA==
X-Received: by 2002:a37:2dc5:: with SMTP id t188mr10877452qkh.97.1578603164320;
        Thu, 09 Jan 2020 12:52:44 -0800 (PST)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac? ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id g81sm3666508qkb.70.2020.01.09.12.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 12:52:44 -0800 (PST)
Subject: Re: [PATCH 1/1] media: dvb_dummy_tuner: implement driver skeleton
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     sean@mess.org, tglx@linutronix.de, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20200109152408.919325-1-dwlsalmeida@gmail.com>
 <20200109152408.919325-2-dwlsalmeida@gmail.com>
 <20200109171345.2cf30990@kernel.org>
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <bb66b7dc-b93c-2aee-a64a-fafc03fb296b@gmail.com>
Date:   Thu, 9 Jan 2020 17:52:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109171345.2cf30990@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro!

> Actually, this is a dummy driver. It should not be auto-selected, as no
> real hardware depends on it. We don't want production distros to come with
> those test drivers.

Let's address this in v2.


Thanks.


