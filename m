Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59BE011F0A4
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2019 08:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfLNHDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Dec 2019 02:03:32 -0500
Received: from delivery.mailspamprotection.com ([198.143.161.27]:45237 "EHLO
        delivery.mailspamprotection.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725851AbfLNHDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Dec 2019 02:03:32 -0500
X-Greylist: delayed 15177 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Dec 2019 02:03:32 EST
Received: from ns1.sgp65.siteground.asia ([77.104.150.195] helo=sgp65.siteground.asia)
        by se7.mailspamprotection.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ifxUb-000AQV-7T; Fri, 13 Dec 2019 20:49:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=fantasiechocolate.com; s=default; h=Reply-To:Date:From:To:Subject:
        Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
        Sender:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=G9LTS5QPxJ/s89LVw4V0N76a9Lg4GJG1FaRG84gTZKM=; b=K8N0bEzDphZjscKlSjR6j9iSc
        72c1llqVhX0jOry/W+dmRZfnuRd5ARKVd1LjJHgYTTXxKaho3eQ2iwlYG/EF2/6Rl8d5FTTLH3Drv
        kMKcsVxEgtNP8dK3K7IOoyQOXv2TO3gFT+qHzZYXRkIgbjmodiMpuAewBK2uLKQi8ltel7lNeNI8/
        ePiDxq/BVkq/ep6i7y5QPF0b2n/KLajldZrdzcZiq7M/6Zlx2WlvQAfuRzOgJxcHR0iRRw/7np0HM
        d4bCsoCNX3NdTkz+YZDWlBQMkD5pQY89mQ8QS7l3/5h0aXLPZ5acpkaXXbjzh+c5Xrr+PGzaQZao6
        yPlg+zTOA==;
Received: from [41.215.171.102] (port=57237 helo=[192.168.1.2])
        by sgp65.siteground.asia with esmtpa (Exim 4.90devstart-1178-b07e68e5-XX)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ifxTn-0001M6-CH; Sat, 14 Dec 2019 10:48:28 +0800
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hello
To:     Recipients <fantasie@fantasiechocolate.com>
From:   fantasie@fantasiechocolate.com
Date:   Fri, 13 Dec 2019 21:48:07 -0500
Reply-To: jackharg231@gmail.com
Message-ID: <E1ifxUb-000AQV-7T@se7.mailspamprotection.com>
X-Originating-IP: 77.104.150.195
X-SpamExperts-Domain: sgp65.siteground.asia
X-SpamExperts-Username: 77.104.150.195
Authentication-Results: mailspamprotection.com; auth=pass smtp.auth=77.104.150.195@sgp65.siteground.asia
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.60)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fi3oD8HEy9ysrsB6Ile+oipSDasLI4SayDByyq9LIhV8Nw6Pyvi7hFS
 tMhEMixUdETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KB9eXr4kKRMt/8NI6nRyH85dk
 whdtMDBdKCPt06ujJs6gJuQ4ybFdwtNPUh7RC2K51dJlG7CFD7CzUDp0wzgIiSi5fazBvvfjcjcS
 a8uu6i5kxw0fsU+wgo0+U1l+/6SPaTPV5JEOjtEBKABL1gt8WQC+UBOLUqD279KrTZrbkdIuvlhg
 +DSbS18PFekPA1tKXKisOtX+aDcr1w0UiqED7KvCspRJYLvrOWkYW411T2rjl3vXw9Qlx1wV+a35
 //n6cD8Xb1k26BasCh5FQBhHfymtX7tq/1rdNEHVvP1BHeT2TtbEAegTqOybviTGvcC99Zn+1DE2
 AZn1zBEJO90P5sB3sH0iNyF+jsLzNoYjiVyoR/RwzSb7MQXcy6vPs3V9inGQlPFMmAobaxNty38i
 BEeM1K2CTBGnkQmDKv4lJmaAj1B3qFxajbiT3oHV09BxHHxzr59tjVEpVY7g3TtkCb5XwDoFAfZB
 K+9a6xO1snUrIOmiWJF/2j4/WKE4BjPm/7vqxTzAaY6ctxp4g2WHgNfdOqYN4Sqy0LlUQZZxogRT
 Yi2bf0F0JzgUQ/o6tR7CohcSBxV4E6jWtV7TUS3QXb24HLFFbGjY4D8nXPs0fhyOg6CxLpurHgxl
 lShABPPWCOHpVNLcUPUrQznR+WspYP5bYHj42NqHBY3M7wxfVxG05QDxJj07LYpLBCZ+i1Ow4pWx
 7WxWFZpsjT/483ewgvgh2sG2FoP1xC5Ooq6pgRcuZ776uHuZaALzAKY8BmR1kxi2g6kxhuc2EktX
 lSJddD6qZfoa3cy5onUGweCshQjEOygmVS8JNKEmMM5/Gwy3sp2u/+Dor0gguhZcVyh35ECHgPP0
 5aYk51bQg7sJgwV4rgA4ymG95Z44WyqZ4q2OBP18vW6odrfO8cAzSdWUJ6ywYf834mLpDmHr+yp1
 T1PFRKJGwZW4/l2NxgUzcsi+GoTbHjcGqAoyKZ/2KR5dh5FCB7UdbO9Jp8wrl7iWjDQo2FUgtHMw
 H/LqgnIgq3+/DftIenXnkBkqUxX3sqTM/0n4w7ejf1JLUbK4TDJt1xK2SZ/GLk+xyuaPgxSB0Q56
 J+xINFUjqYYiM9aU36InJ7kkBtJTvlMqw5QSnZAtY26EYj5xLMeh4uMgxf4KeHsIwpHVKZ/ANojJ
 Cxy+4SkWr5x5dk0bQRRsQsDS6/1iF04FJfU4ADLK8hMEg9c4n9PiK4z6h14TZGLgF58LQ7d0F7LQ
 Mr8TxbHCfyYXAxy9SbGtI4g+l6rCWbY0MZcgnbHsBpRqgH8VAk50oD/E74qH1PbkuHAPxJO/svgx
 /9Zwr4SVu7WooTPmUOS7iKQtss6ojyTfeFzBXJqmNMWfOfxjLKwuNSLqK50v9RRBRvP4y0RYiXAW
 pM4uX/RUTRsS9HuaiwQzKw+6v3CaIMG6s7LqJPKZCV43qss838rokMzww9nhPrVfKeK/bh9I+N+w
 zPUqatgHZgaYS8BJ4xW0m7w+Y0inAoHGgawaZ5SDpWovLyhy2DNwOgV373pfDhBQ21OddcoCwRWN
 03JvImukOG/XZOlExo6U3HQHEuesiC0WG8K0XwUnArDXHvo27ncP1VgcnNk/7jc1K4l39DIMPu41
 AFL1MsVayGEHNC6qS9aeWLW0rJN9CJIt9ka0CbQPZx32PBfyCUQPGRfAuQJyQcUhQ8AeEA8asL+m
 lQw/LCpk5P28Q7LWnhf6CJ6k30ezHWrt/An+wIM4O33Q0LoLoLOpng==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Are you available?


Regards
Jack Hargreaves
Broker/Financial consortium
