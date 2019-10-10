Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4D1D2797
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 12:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732882AbfJJKzu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 06:55:50 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41303 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbfJJKzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 06:55:49 -0400
Received: by mail-ed1-f67.google.com with SMTP id f20so5029611edv.8;
        Thu, 10 Oct 2019 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MKKhvnX8RUfvjd7XqlUJvJa6PAylZIB/SGsvMUWzdfs=;
        b=Bvv2TJW8EnbStBJDHoWd3YAKOcDgrCgpQ5G8m7iO/Jk4b820qygV/ZTxqRSAvq8RC4
         NP7nXhAHsTvOF9acTskruxWPu5qzQHVzDXNcHRILEER5aVxtMW4V+ohXf416UTFzb8JB
         CFNsE+i8gH9uIx+tryg8AChDHHO+L8T6giYb48PzMtHKdwWE5AADqkZJ6qJVuKWBuH0X
         4JhT193MZ4vv8pdMd6rPL33q8wKLDxeOSt4kSyx0aKnRtRLZfCz+Q1+DTMzR8PpMY68J
         l7Q8y9GNyrjfLrIMTULHNaa6jZ2xQsmnztzTNO93KwLh8d/rfi1sZK9qmAeOfvMnUAZu
         I5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MKKhvnX8RUfvjd7XqlUJvJa6PAylZIB/SGsvMUWzdfs=;
        b=Q5H2V8+08a+8tttIfWP/UOTqmiurjoQE7f0b1HHJYMNH9c3B6sikwru3EENyuRk7Qo
         3aFrkA+C5ul5rqPtq0rJILLAn4mWa/yGHNvNaumSevYG/7cGwQ3hR6sba3KfRnawimIy
         AeanQ6ozeZH4zknYh9UZF4kg4/tIRxwFI29PVXr7pvtkKOa2C/t2vnxSPD4M2gFatOgC
         kjJofuFec3vLW4PDYdeDl3YTMrHsEBvmyA9Zcw6vOXwKLjk5nE7QqsRM7VIrP0kj1dAS
         GqFXrq2g8NRqx3Ysy5X2WNzi6FzYy4060M7/f8UjcWdSg3Klwn3L+rXI12l/ewOkYDJg
         caGg==
X-Gm-Message-State: APjAAAV9Mts/Vey7HGn/y5RA7lP2c0N6VDA/r/PBNPLud1PlLTKu+0CT
        DzWbOpx19ZQX0q2TuI4UK8Q=
X-Google-Smtp-Source: APXvYqyoHTR9kC/Gbi3eiCrgqTCy4+sQW0K9Ipw61U1NI7YRM2OGdnOD+4oxZv6kTa/p4s6qL7sUuQ==
X-Received: by 2002:a17:906:5051:: with SMTP id e17mr7309123ejk.139.1570704947866;
        Thu, 10 Oct 2019 03:55:47 -0700 (PDT)
Received: from Limone ([46.114.37.24])
        by smtp.gmail.com with ESMTPSA id x17sm870206edl.64.2019.10.10.03.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 03:55:47 -0700 (PDT)
Date:   Thu, 10 Oct 2019 12:55:44 +0200
From:   Gon Solo <gonsolo@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] media: si2168: use bits instead of bool for flags
Message-ID: <20191010105544.GA6507@Limone>
References: <20191004090855.14e418ed@coco.lan>
 <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 04, 2019 at 10:15:22AM -0300, Mauro Carvalho Chehab wrote:
> Using bool on struct is not recommended, as it wastes lots of
> space. So, instead, let's use bits.

Wouldn't "bool b:1;" even be better? I performed a little test:

#include <stdbool.h>
#include <stdio.h>

struct uints {
	unsigned int a0;
	unsigned int a1;
	unsigned int a2;
	unsigned int a3;
	unsigned int a4;
	unsigned int a5;
	unsigned int a6;
	unsigned int a7;
};

struct bools {
	bool a0;
	bool a1;
	bool a2;
	bool a3;
	bool a4;
	bool a5;
	bool a6;
	bool a7;
};

struct bit_uints {
	unsigned int a0:1;
	unsigned int a1:1;
	unsigned int a2:1;
	unsigned int a3:1;
	unsigned int a4:1;
	unsigned int a5:1;
	unsigned int a6:1;
	unsigned int a7:1;
};

struct bit_bools {
	bool a0:1;
	bool a1:1;
	bool a2:1;
	bool a3:1;
	bool a4:1;
	bool a5:1;
	bool a6:1;
	bool a7:1;
};

int main() {
	printf("bit_uints: %ld\n", sizeof(struct bit_uints));
	printf("bit_bools: %ld\n", sizeof(struct bit_bools));
	printf("uints: %ld\n", sizeof(struct uints));
	printf("bools: %ld\n", sizeof(struct bools));
}

Result:

bit_uints: 4
bit_bools: 1
uints: 32
bools: 8

I know with different types within the struct it looks different, but
still.

g

