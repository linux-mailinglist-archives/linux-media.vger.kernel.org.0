Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B66E42BE8F
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 13:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhJMLFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 07:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhJMLDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 07:03:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1668C06178A
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 03:58:46 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aby1myCqQx7rIaby6mOoY3; Wed, 13 Oct 2021 12:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634122722; bh=hovtf3uJo4srOdHSZY4NwYZa264IU3iT/uKB7h2QPQY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Vzd1u0XocWXY7OziyIpWsEfy9YV0yhDtSr/Gjjp30T3nYSJpzWsWYINfleFYpOcPy
         M5BcgVrxNr41El5Cb2nugxGI8F+bl78dl75ywURJqWTeh0MCWKb4CPSG5XneDQ1rIG
         k605NXNzme4kHzGuxY9uVc3ZHX+tznbPYgop9i0NMtke/RZK/jDk/4fQ3k8lfJX64i
         XZRQZYAlbAhVl68S3n6LqCNXDgqZq06H0ZzWDwCeKvmHcGBJQHD+y1pirQJRSSeEsw
         mo+qbpMOQvQF7Giy+2d9Qnoi/jeY7rYQa5pMKl0HdypmOqHJSCvqozI+u3BlFUS+MM
         bWfA7D63AgHsg==
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: v4l-utils: time for a new release?
Message-ID: <379a9c95-c42e-0bf9-83b7-b62c9acfd598@xs4all.nl>
Date:   Wed, 13 Oct 2021 12:58:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFAzDJ8JB8pRE/TKBSbEua3pIWiJP11ge/tR7dNLbgZZWvGuhlG64bb3U6X4hPKk5uNTX4P9UNr/Id+xxWP5E06UrhPt0Y64FulWnhZd/UCmucYkLQCZ
 Raprv/OLeDuYNgNdOpr4Xvf7/oWDHcxf3BIsxOwab58EsjxdzyfSZ17imVriJ5JuUB6jCmXMJeXTOwYWz7zDI08zE1hIkQKECCpFiVAzjXvEt4+zyiRYgA39
 Rzr14x/n9ZN/+5vB89fsWj4/PC3HV3E7QZhPPhdS4UsbJjroJsqIc5dh8WNv3BGIIJupLymvoP9AfDGbeS+/rUSwmSTssX3bBRHYFfUeDgo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

I think it is a good idea if you can make a new release of v4l-utils. It's a long time since the last one.

Do you have time to do that?

Regards,

	Hans
