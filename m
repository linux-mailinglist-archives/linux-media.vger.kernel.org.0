Return-Path: <linux-media+bounces-42114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4B5B4FC27
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 15:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFA8416B151
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C383375D3;
	Tue,  9 Sep 2025 13:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g9/fyDS4"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC0632BF5A
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423675; cv=none; b=hfXh4FUvdSR7KWHojX8AhnF5ZEdh+idJ9QykhRZDZN1KMjadPo/ie3T9Yc5KnOfbmTCHc19SQE7C4ipwfEmO3LyU0tFoirKh3rmelk+rM9PuRXhKTOGFzfMiyWauRspgpm5oeVyj3i6BPVoOgdGuVOj31fYCTcJ8aLsgYZqhVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423675; c=relaxed/simple;
	bh=5qtSog8+Y9p3FJUTRsAF9fbJypKQCmatBj7jcEtMMts=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M6XCWwrqn3y6OMYcACaWd0hulaTP1regUehIpHUty3CJ0W94HiJ1hjhkwyCY7Gq/ZEISARySFxHgyYnt8jie26OtBDI1oW0wBrcTMxtR7P3F/ztVhvJnU/pcgVx/Cj3YI2guY3dvCK3V9lbLOfiA/pClM53+R89prBT4UQG1bCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g9/fyDS4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757423673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mVBae1HjI4LvWLDh5UNoen9YkwwoxhzTC6pla5M78PI=;
	b=g9/fyDS4i1HyN7YRcnjJ0AddEmSXJqiseWP4EQ8M98KWShqJ7WMt2n1ABeatVkMkxp9J1G
	3rT9HIV7BjQS/mmo6FWJ7Agyqrw7oT8Cx6whsaR0P/qBbPGDVeXCLLpVyZmuswikCqY0mu
	k/c0YVc7OH92I09I9dPYIltZ/otcHwU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-dWUDg7SRNfGU5URnUncVHw-1; Tue, 09 Sep 2025 09:14:31 -0400
X-MC-Unique: dWUDg7SRNfGU5URnUncVHw-1
X-Mimecast-MFC-AGG-ID: dWUDg7SRNfGU5URnUncVHw_1757423671
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e04ea95c6cso2653225f8f.1
        for <linux-media@vger.kernel.org>; Tue, 09 Sep 2025 06:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757423670; x=1758028470;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVBae1HjI4LvWLDh5UNoen9YkwwoxhzTC6pla5M78PI=;
        b=If7Vnz84eXz7hvpzwuO4xJoZI/aL/UwSxnNOh4AC0yT/O4d6WG/EcL3+rMF38fvy5r
         5RpvbchGwQIqdme4jDb7SRxknVOQNNGesAgqyFfQ3hl/azZUsPXluD6d+ZaAO2R7YfCq
         GKWN6zL/eHRCr8EVfYMFSgt0rjpcckws+uhmnc+iZsCgoUIJCuOZm/tO7LidjZEL9vpf
         YdeEEdnzeQbXDTD8n/9YJ2WfCSCk2eod7rzu7QVk/6WUXvY6OW4qAw8E9uRUMFYboBeD
         /aQEL3o3jO9OasUNZ+/e9yhhiQcRGIkJf5541ZyfSWKD7k2L1MH3LJBR6OV88nlictXG
         wW8g==
X-Gm-Message-State: AOJu0Yx2sPT+YL6NXT1ubuOO+R7SfkLgXVgTPt7Ho/f++tGcECmN8mKl
	35rw1lDiOz5Zi2zp5cyB1opTHU2LShokuNUop8bibcx9WqQccB64I+QCSQCqrtqEAyEUNbXmwvK
	RPwHl4TaZgyHJTFtFnmOy11DdYgPAdR7vJm1mlliJqHefuCxoJmsqve2AFthpeJDX2MUAW6SGaT
	HzhDWTqt2wKMQ0vAVXE/035DQemV1+W+eJ27OAO20GA7Fdylw=
X-Gm-Gg: ASbGnctEQ5IINfBCdZhndOuK6NGhcopJPsRLYWLMAJTdsoJPi/2hr8YkJKKf21I5shl
	kcLybbbwrB+lDozQhaCuge5ROL3oWZFzVIKc3DE4uOSSBBe6PUBcuiXpq1ZLmctAj7DqpN/Z8p+
	UuQ0JUzJNXp4zdeRZlaf4DMk///hUrnm/QyIU4KeTF1r7g4iRf9Pu+EfPqrekjiVcqGkN7Mnkjk
	J6zTtLMkN1+9mHdaxviQIeLKGsHh6STACD+ZRgq0Jf5CW8G6JIs+oGlmdpQZ4ew7IUFCF6bK5Es
	w1JSWuWJhSJMxvAADIsdy9B3si5oMN7J1fRjmnQq2QooGC7keVkrZvlCQj3G2yWgh/ilGyN2igu
	rO/jeGw==
X-Received: by 2002:a05:6000:2883:b0:3e5:6dbd:2114 with SMTP id ffacd0b85a97d-3e64ca759e4mr9068485f8f.59.1757423670661;
        Tue, 09 Sep 2025 06:14:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX+EFYpmF0p2AXA43D0xb0c/Exuy1VYQjBccvhxwylIS5GNf3eZYjC5VZ0hIY5UAky0FCMHw==
X-Received: by 2002:a05:6000:2883:b0:3e5:6dbd:2114 with SMTP id ffacd0b85a97d-3e64ca759e4mr9068463f8f.59.1757423670227;
        Tue, 09 Sep 2025 06:14:30 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-113-183.pools.arcor-ip.net. [47.64.113.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de5eabdb0sm93459285e9.8.2025.09.09.06.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 06:14:29 -0700 (PDT)
Message-ID: <680c0aa0-fb89-480a-bd28-f33b9f3b6343@redhat.com>
Date: Tue, 9 Sep 2025 15:14:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: media: mxl5005s: Replace GPLv2 boilerplate text with SPDX
To: linux-media@vger.kernel.org, patchwork@media-ci.org
References: <20250820125516.494408-1-thuth@redhat.com>
 <68a5ea9e.050a0220.2a8c29.7282@mx.google.com>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <68a5ea9e.050a0220.2a8c29.7282@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 17.32, Patchwork Integration wrote:
> Dear Thomas Huth:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/82873240/artifacts/report.htm .
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

The failure looks like a networking problem in the CI job to me... Could 
somebody please restart that job?

  Thanks,
   Thomas


