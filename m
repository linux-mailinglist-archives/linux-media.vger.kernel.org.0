Return-Path: <linux-media+bounces-50070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC369CFAC3E
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 20:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC05431BCEBF
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 19:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37892FCBE5;
	Tue,  6 Jan 2026 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZdw9btf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8332EFD99
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767727960; cv=none; b=DtoorjdkKy/GUF2YmSDFY2C8MfxU+lW0DOGs2QYWHhffnVJR3505jL8mWibxarAdvjoFHZ6SKZvA7MoWwwcMRLtxSi9TL5m0RUSLhFzBuLyosopDjBSpTj5J5ihUybQm9UAE5Sye8L7tvtom5SYK3P36mOYvRoGghWWuB3+13is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767727960; c=relaxed/simple;
	bh=eoBCBjo/KSoxejYCD1xX6+n5o2xGH1pTIUXqFKAPS2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lftT4BJxxAHzdE5/18HA3QXr5PRZ+6dhuPWfTiFvIoYrCgQXPa977v3kYW9fgEsH1Yq77PK1aVYQlYxG3ReSOPjcfGatBzdB8EMOd+Qt6EKPm4YPnFQOHWcLiVQBzJZoRIxdUECVBSH/vHHZaoWhUSkUsHSeFHtMZpSMg9/FAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZdw9btf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-431048c4068so83484f8f.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 11:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727956; x=1768332756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5ExmjzRt11H31bMlKYOhViS+00PGFmBw8wszOB9k6Y=;
        b=nZdw9btfuv3XQUvIVfi/FzVIQK3dk7N+yTg60Els58NGPsP5awU6F3ho+N1Br7RfmQ
         fZOKw//NcKiVWtIxRGlh59PWq3z+67uid4TzjBchTVHhfWFMhQHyyCIem6hqp55W+PT1
         azX8P2mQELdF3C3g8UXxpQ15KKO5hzOvGpfA+AHTbjTJW9YOgqaMqO5fB252HDy79cKc
         dJzB38kohFI3dlIU79m2LkEKWYRtLfVdJcL5EeexmEy7wWUsf/+qOvMEWjTdI32MP5QB
         8ZJ75PG0RCyRljpP0PlnvpgDsblrOLHvpLxey4PgrAPmvc/yVW++uXaR8Bg2zLSDxCjo
         JgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727956; x=1768332756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5ExmjzRt11H31bMlKYOhViS+00PGFmBw8wszOB9k6Y=;
        b=HNH/m2qHr15vQ1yUzSS7/MkDgggyQnyzWauwrplEWTJk9+Rn/Vq7ncMbyVZ49inDtt
         Q6/R5wvN8PUcS5LpXlOigs/Vb6AJRNCB3VdUfd4qXqpyL+hhJSKeeC233R8QyA94x8Oz
         XKomKaVJJzDMmkzH17AiSo5tC9lIwX9+9Xbrm3IL2gLSKx7sVJLMw9ax+3lRw1pkfl2k
         wdYbq+gxyvAQkpo1/IciNDOFk1y1td+FkPcLQxJhjfEdjszSBoZRzxHto46NlcN9awDe
         /1kKmZ5u9+I2b9YQO8a80B90Rb57ZK2GaopEjy/8koylekTHhgEVplAFlvEqO8OjXAr6
         GmPA==
X-Forwarded-Encrypted: i=1; AJvYcCVluvzTZ4llXv5Qw9CdOYCCgX7k4XsUUspsJbdWYmz+UU5n/MqbFUaMQtZYsyIqzUkP8Tk7QkAJ266Iuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtkQs13A5et889UvTul4Da23w89aIX9KMqXMzf9icGYYUaqkA
	defRe+LmqSZYen1puxpCoI/lKHdBoLIvGu3hptFReIJgYMJD3KIhXyjw
X-Gm-Gg: AY/fxX7mZftYPgXCF6S9+g/AObS6NuaPfw0bjNRgA9XJFoKzrUSkXs7/CgNS9oI/fsZ
	nvE63x10EC82vAxBydM+FqsNWnttSBw0HB4em+EU94iKxfz4G4eTv8iqFLeRQH1WltVasMWU8vL
	pdg1lBFgoM273Qvw4Ei3vXC+ccB0IaRzFAdyNa/8h9wMvEHeIBZVNw7bHIbWGAphCCeMQCFYgl4
	wMfhOGIlGYnagY7jx3VkbMW7C+bgA/allcDz4ARkzh6UuLrTy5y2ZGsy0ROO5VnotS+ZGj0MLgB
	JlWQwPvbKqkW4qQgrjgUr72YwPY0dysmIKoeoearEJN9VGzpelZ2D0qAXozXDlebnaH9oOCsrs6
	zXb0rrOP/PWg9VCuxCQxmjU6tkoMWcttekI6QITNuVfJZE8NUpD/XTSbR0od9YhlTf7J+TMrpWl
	ts13I92qZWSujhkn2sUJkTsRDKkjIPj7S7xcnjJPTvdSgsV/3GcsVZTJMt7OgKWEjKVH/bJBme3
	kPy+64/T478AX5gzXqjN/cg4jWd9DQWZaL/EdSnlOISdDW9PX5qvJQ17y0Qv1YZ
X-Google-Smtp-Source: AGHT+IFIh4UFL5ktKvizijTqM9ls5ooe70zcSXJi12HfQ2Im3m/BSeK/gwa0FGVa9q2qDIVhMmmdpg==
X-Received: by 2002:a05:6000:3104:b0:431:cf0:2e8b with SMTP id ffacd0b85a97d-432c3778e47mr273696f8f.29.1767727956009;
        Tue, 06 Jan 2026 11:32:36 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm5933503f8f.19.2026.01.06.11.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 11:32:35 -0800 (PST)
Message-ID: <275fdece-d056-4960-a068-870237949774@gmail.com>
Date: Tue, 6 Jan 2026 19:32:32 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 10/11] io_uring/rsrc: add dmabuf-backed buffer
 registeration
To: Ming Lei <ming.lei@redhat.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 David Wei <dw@davidwei.uk>
References: <cover.1763725387.git.asml.silence@gmail.com>
 <b38f2c3af8c03ee4fc5f67f97b4412ecd8588924.1763725388.git.asml.silence@gmail.com>
 <aVnGja6w4e_tgZjK@fedora>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aVnGja6w4e_tgZjK@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/26 01:46, Ming Lei wrote:
> On Sun, Nov 23, 2025 at 10:51:30PM +0000, Pavel Begunkov wrote:
>> Add an ability to register a dmabuf backed io_uring buffer. It also
>> needs know which device to use for attachment, for that it takes
>> target_fd and extracts the device through the new file op. Unlike normal
>> buffers, it also retains the target file so that any imports from
>> ineligible requests can be rejected in next patches.
>>
>> Suggested-by: Vishal Verma <vishal1.verma@intel.com>
>> Suggested-by: David Wei <dw@davidwei.uk>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
...
>> +	dmabuf = dma_buf_get(rb->dmabuf_fd);
>> +	if (IS_ERR(dmabuf)) {
>> +		ret = PTR_ERR(dmabuf);
>> +		dmabuf = NULL;
>> +		goto err;
>> +	}
>> +
>> +	params.dmabuf = dmabuf;
>> +	params.dir = DMA_BIDIRECTIONAL;
>> +	token = dma_token_create(target_file, &params);
>> +	if (IS_ERR(token)) {
>> +		ret = PTR_ERR(token);
>> +		goto err;
>> +	}
>> +
> 
> This way looks less flexible, for example, the same dma-buf may be used
> on IOs to multiple disks, then it needs to be registered for each target
> file.

It can probably be done without associating with a specific subsystem /
file on registration, but that has a runtime tracking cost; and I don't
think it's better. There is also a question of sharing b/w files when
it can be shared, e.g. files of the same filesystem, but I'm leaving it
for follow up work, it's not needed for nvme, and using one of the files
for registration should be reasonable.

-- 
Pavel Begunkov


