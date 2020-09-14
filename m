Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB352691DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 18:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgINQls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 12:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgINPOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 11:14:43 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FA5C061788;
        Mon, 14 Sep 2020 08:14:43 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id q5so454175qkc.2;
        Mon, 14 Sep 2020 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=OD2XGGa27niJ7TfndrV66ShmAkg6komZ0A4btIli5fk=;
        b=P+nQWL2MURjqda1ZVX9DJ8IR0t30mmzUNd4HNxEXyrVN8l+fLbRK2ltS8ggA4172Sd
         7kOFn1UWubddBYc7hjQ5HXMdXNP+AXSJd9/pG2huzfkohjpqik9rbxG00tLpbgm5n7eg
         mEOWwpZ/ROC/vClWjwd5l/C3CPWKrut4Ns4MTofEMyDY0b3ZbiMEIhBsQnfpY/uyq7lH
         S9EZMDfsjmdZfUsUqPeLSAFE3oU1HIchpxRUlkX6lAxEs9ZoZQPeQkzxTK6JqXyR9CfB
         UdXZUdCJneZ/6FeZFu0GmCF/TjHkVyYpXjxwzOg3utLMQDn017sgCnPKHg8jTjiXKcha
         5udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=OD2XGGa27niJ7TfndrV66ShmAkg6komZ0A4btIli5fk=;
        b=b5UZ3vDM74NcU7dEeGw0Sz9pIT3l5yYi9T/p6ZB7CXC9rd2fjjyBmo4c1/CL210Jyv
         UYXlrsBHEqDVPPGsplTaN/G1JhZo3kqpmtDh+gvqbjsOXQ/61u0sc2AHoADhiPGYcpVt
         fa/wN/LqSMhBUSMlZpdoiJf5R4O+1Jo1CnfcOJZWMP5mKg+fEdIfIOY9WAewDDMOYOdR
         oXlAbX3MY4zjetaSexL+tkwPjyWD9q0depG9AyqPIN6gCG65ZYZPelG6tBJK7wZbu9T3
         2sE8dfWTHjGNBePuSgdJ/YWY4X4nSfAS7ukf6HMOHWNS3WXCmxyNhhy91MBV+qQcxoSc
         pwgw==
X-Gm-Message-State: AOAM5326zhKSrAqe6Bx9c82+NS5YqbQbo1M4UTmXYODH2s/oxVUsWQcA
        RCaukm+VEqVwhzJPYgrXW96/ph+eOqUxgw==
X-Google-Smtp-Source: ABdhPJwrXM+XaygDRbo/q8a5SAU2SNgQC2MoeRECyx1qlERfPCeS15qH8dENP0qXFobAjBK8J+Btqw==
X-Received: by 2002:a05:620a:1125:: with SMTP id p5mr13033953qkk.328.1600096482105;
        Mon, 14 Sep 2020 08:14:42 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id 2sm9293971qtg.20.2020.09.14.08.14.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2020 08:14:41 -0700 (PDT)
Date:   Mon, 14 Sep 2020 12:14:38 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>
Message-ID: <68DDA2DD-4341-45A9-99CF-BF41573C9AED@getmailspring.com>
In-Reply-To: <47ccbcbd23e44159bbb11274b540d7c2bb66be7c.1600073975.git.mchehab+huawei@kernel.org>
References: <47ccbcbd23e44159bbb11274b540d7c2bb66be7c.1600073975.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RFC 06/11] media: vidtv: get rid of some endiannes
 nonsense
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

> Genmask is always highest order to low order. It doesn't make
> any sense to make it depends on endiannes.
> 

I added these #ifdefs due to this:

https://lwn.net/Articles/741762/

i.e.

Fields to access are specified as GENMASK() values - an N-bit field
starting at bit #M is encoded as GENMASK(M + N - 1, N).  Note that
bit numbers refer to endianness of the object we are working with -
e.g. GENMASK(11, 0) in __be16 refers to the second byte and the lower
4 bits of the first byte.  In __le16 it would refer to the first byte
and the lower 4 bits of the second byte, etc.

I am not 100% sure, but maybe we actually need them? 

- Daniel

