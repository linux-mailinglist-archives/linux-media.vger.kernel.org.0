Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41767303D5
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfE3VJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:09:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44364 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfE3VJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:09:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id c9so1469258pfc.11;
        Thu, 30 May 2019 14:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j14yKpcraW/rk5VffAXFmNUym97W4z1OGk3c597/tVM=;
        b=QK1diwgown3rJt0cB8vXV26gQVEfLpYfy8VwmoYRrIcAwHL7l7U2IUd2s9XOHUzm1j
         vtv9rpjrwza1F/3QNmq16VjemwsPHO+orrG+fUilKc0WCS3fGHS6imwQrF88suA6xOc8
         04gYKkUso1YipS9qM5DGa5zgLlYssgmFGnZEY8hcDccKCxmGIsMrE4jtpSbCsyMDsrmI
         Frq8a0F6p2svJn5nfeZvhGnEbOgA4oEEb0PPvwu2ogvJ1NYcBdVO8Me949P0M6b2t2bF
         tXxoY8n62PSpu/e1EVoSPmV1B+dPr9F4vmsliOPvPsR4zkprfPmbHyc+osmwMwSJYUXG
         Hphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j14yKpcraW/rk5VffAXFmNUym97W4z1OGk3c597/tVM=;
        b=Pcc5RD3N4YVxqOjwewO7v4/43hSONiLXcMhqLSWKOOuUKtkc8fqIZMegan/XCjTimT
         x/d6mwOZIJOoOaFRvuIWRk68fWsMsybSFZXtcOHpIrr9NcGH5keJrRVxFsYNru3q9u8R
         VQFMJhfxTEsNCUxmZLJDrmy1u3FALTi4mILAaGR35h7RNyE55usgfkTfZ5dXrTssB+9n
         JTIyVQpR2jl9FiXcttxpy+VBN5fJyfAxd8/qTWvbuBuR/2BmfkfSOl1Yj8pTlNSVDxiD
         ardVvO5J7iU6hkJ78qrAo8foDP3+8ljRmow8hrmJhP2UldMGIugrpsNtkEJu0nyb68Aq
         Ti5A==
X-Gm-Message-State: APjAAAU9uiFmA/HUMV4gCpK3MWkSEyvk93XrfCpodiY49Ae5GisuYHYu
        qqV5w+D+5tmtp0rPGBnqUZC9/FyX
X-Google-Smtp-Source: APXvYqyyMX/HcnvTDhYbABKRcF/fe6hNOlg0dP/SvOirSzwJX44yR6CjJMc8vQDER9r8e8H3a8OW/A==
X-Received: by 2002:a63:1d05:: with SMTP id d5mr5356299pgd.157.1559250570518;
        Thu, 30 May 2019 14:09:30 -0700 (PDT)
Received: from [10.0.2.15] ([47.15.209.13])
        by smtp.gmail.com with ESMTPSA id p21sm3799580pfn.129.2019.05.30.14.09.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 14:09:30 -0700 (PDT)
Subject: Re: [PATCH] staging: media: davinci_vpfe: Remove variable vpfe_dev
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hans.verkuil@cisco.com, mchehab@kernel.org, code@wizofe.uk,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20190530204718.29892-1-nishkadg.linux@gmail.com>
 <20190530205540.GA5308@kroah.com>
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <9b870baa-4d15-cb72-0579-6bb6ca57cadd@gmail.com>
Date:   Fri, 31 May 2019 02:39:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530205540.GA5308@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 31/05/19 2:25 AM, Greg KH wrote:
> On Fri, May 31, 2019 at 02:17:18AM +0530, Nishka Dasgupta wrote:
>> Remove variable vpfe_dev and replace it with its value (since the
>> function otherwise uses values directly instead of local variables).
> 
> This says _what_ you do.  But we can see that in the patch itself.
> 
> You need to say _why_ you are doing this.
> 
> There's no need for this change at all.  Again, as I have said before,
> we write code for developers to read first, the compiler second.  By
> making these types of changes you are making it harder to
> read/understand by a developer, and providing absolutely no benifit to
> the compiler at all.
> 
> So it's actually making the code worse!
> 
> not good at all.
> 
> Please reconsider this type of change, as I keep asking you to.

Okay. In this case I thought it wouldn't make it worse since the 
function is low on local variables anyway? Clearly I was wrong, so I 
won't count this case as an exception in future.

Thanking you,
Nishka

> greg k-h
> 

