Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4292238E8
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 12:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgGQKEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 06:04:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:54571 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbgGQKEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 06:04:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id wNE8jCJmcNPeYwNEBja7Z4; Fri, 17 Jul 2020 12:04:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594980268; bh=rrZ6Dtj/k5lf5p9V9FIJUPXXEPZN0uR6pQNpSBVg45Y=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wA7Qvoi8nWloIJsE98VyNHRVU2WLjBRP/jHSCC0jO2T96QWQZITYYxN/CPjJKlpkW
         HXOjhp/doImZf0ewWfxWtEXfTT+3LkTliD6T7Yd0FyloZE196LrbZuxrWADb6RJDEY
         1omqL6l2U5RnwCWoab5GF7nHVP5GKtqacUmMysUa5meYXeQkSn2SR7OSaoSDjCPmT2
         9aHGTq6HRWQxF8TO1gcbJeRrhkOixGAkEZu2ABpcq0F3XL+d2cJ8vBftC/MKcZmapb
         XWicqRNsRRa2dGV+xMQg+zkVjRIoLd5r/o2rOYS7Y0YDlvvXsJxFqyVB560CmDuAgc
         LRgm+DNno2MKw==
Subject: Re: [PATCH 3/3] media: Add support for the AM/FM radio chip KT0913
 from KT Micro.
To:     Joe Perches <joe@perches.com>,
        Santiago Hormazabal <santiagohssl@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-kernel@vger.kernel.org
References: <20200717004441.116248-1-santiagohssl@gmail.com>
 <20200717004441.116248-4-santiagohssl@gmail.com>
 <b8cb9dbf-2a81-6a12-c754-e524f42a0574@xs4all.nl>
 <9bd42f458908eedd810c5e8805f997997763d32a.camel@perches.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <234961cc-f783-475c-d3db-69720a7da010@xs4all.nl>
Date:   Fri, 17 Jul 2020 12:04:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9bd42f458908eedd810c5e8805f997997763d32a.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJs/gkRtd76okay0EWfgoAD0FciTSEHoyRVPjO3MEwaRjuc8U7lRy9Zt7i+Cjwci9G8RvFYG6RwM8zsP1GIHWBZY2/By70bHpjbCUGIy+/o31u6CmFRe
 WmkH5Zx+ZkcQnlbUQ82YNl1c6LBA2rOjBNEwsaAsLDLIBRzAVfSuj3Ee68BMD0skFhfVEI2DC3THynN/epxt/u+bz385VgLcGJauk8sTo4PQxGKSRLzTfhUb
 Bof+Pk5XKAXA+DNLLSlXIo8MGo8e6HlqnxYcP9AHvlbkMm4k8Kb45J09ej96XBhkQCoc0WwOlV8WWjLkDGtogySnARbvg6vp1LiXLREza1JFl8KkrG8oOD6u
 0et+8avlUP6mSus8O/GvPzWtTc39QA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/07/2020 11:51, Joe Perches wrote:
> On Fri, 2020-07-17 at 11:29 +0200, Hans Verkuil wrote:
>> It's standard linux codingstyle to use lowercase for hex numbers.
>> Can you change that throughout the source for the next version?
> 
> Is there a standard?  It's not in coding-style.rst.
> 
> While I prefer lowercase too, it seems the kernel has
> only ~2:1 preference for lowercase to uppercase hex.
> 
> $ git grep -ohP '\b0[xX][0-9a-f]+\b' | grep [a-f] | wc -l
> 1149833
> $ git grep -ohP '\b0[xX][0-9A-F]+\b' | grep [A-F] | wc -l
> 575781
> 
> 

Well, it's indeed not a standard for the kernel as a whole, but certainly
for drivers/media:

$ git grep -ohP '\b0[xX][0-9a-f]+\b' drivers/media/ | grep [a-f] | wc -l
109272
$ git grep -ohP '\b0[xX][0-9A-F]+\b' drivers/media/ | grep [A-F] | wc -l
22392

The media subsystem has a 5:1 preference for lowercase. And uppercase is
mostly found in older drivers.

Still, I really prefer lowercase over uppercase, especially in new drivers.

Regards,

	Hans
