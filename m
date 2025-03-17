Return-Path: <linux-media+bounces-28382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC353A65AE3
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3638189AA6C
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6ED61AF0AE;
	Mon, 17 Mar 2025 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cFZSmUuK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B661B21AA
	for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742232789; cv=none; b=Pmvm0618q1oYZc5iRnIejt6229IkO3oYSGUtNYH+CInXNtHZgjNi9h5+6eyXrNnDIPDL2pCDJhL1XGCIqd3ls8RyZ+J/7lo0kSH8sWZHl3wjecRtSgbVyTZjaqDxYuIqrbrc5+8sN2R0S6W5hC2vj2D/9CSZG9JDoD+pCt6B0N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742232789; c=relaxed/simple;
	bh=5RRrVErcTRxnKIdxPJslzQPk8A/oK+G3itW7nO7KTa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddqCnKfJUTg7BlNpG2BYLPON7qvBXuURsTLb48VgjFklVCkDA00hjMgesqyMRAZ1HVzvB09sV0Nxf1oo6S/mdv9+zGa+qzWkUYV9RpKlU29nsaAhFvrldEP3SPPXWoS1IjhP3yUiTrJgc3lrxoZu6MMgDiojae3jem+R+liFVcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cFZSmUuK; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c24ae82de4so536720885a.1
        for <linux-media@vger.kernel.org>; Mon, 17 Mar 2025 10:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742232786; x=1742837586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0NZNox6iu8xJBSg/RTYdvnxp/atiz7Hx4e9AIceCd60=;
        b=cFZSmUuK5YOhWwoAdHhsw7091vWGklI5bRhzenAYbhNt0wgxUHpzTTSizas5bilQPp
         +26Pgx/IFs2P44UjprDdwXj1IwuE09llFnlKVytFm3gSp+lFM4CldeaHXfzvAJ/A8o7Q
         2/D4MDQNSgoehBNkqyYn6n8Jq3vMZThpisACt6qtcWR3qv2ot5gWgR5sdRiyOiY052F0
         0oeU0cj2LEFMlvgip7bkXp3yh79QMKl4SVpW4FOf93yuXnGAAtIAzwTlPd0MMnB/0AbP
         86r9oBd9Og5O1b8Zxnxd37aQ/1aZBTn9G7SIMjD9PljYuLFS1Qfwju0gV4d5FsiE1HL1
         jTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742232786; x=1742837586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NZNox6iu8xJBSg/RTYdvnxp/atiz7Hx4e9AIceCd60=;
        b=DX70jsMCWeTVJRkMmfQ/x3Zro85vYgMzG7/1gk7JMmilz76UahfL4Aij2IO8/CJQKw
         ospk3BTLoiSpzzyi72YZoP2lnE51EIB6AVSSguRQvmzLCtjF0UFULmrCiVLLyrmDd84I
         oNjgIKGUcGaBDtuGpEHf0lT8Lb/6J3wTDoJFvM9qLIgl4hG5opcKFDpYy90XfI/zuAvF
         kVW0ci4EIq/fMLLhFtbRv9FAvBNir8bpZyTxzjcEHixAm3u+g7B9imNOd8q5Fvs81TPC
         YdPsEd58QIxrWeEj03ymz3rhJSAkoP60+2+N/rfsH/OpobQ/+RFzMF9E+nabXBaZGCzc
         zvxA==
X-Forwarded-Encrypted: i=1; AJvYcCXtfSgqV0vid5Go02ToZPltGuXbbabhCoT5UCN30qqVb+iD8imutMwi/CIgfGSBl9m01dC9eXnOcLzPBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdnoZY/IVBkOxmyRrYT2+Bgj8AJoYbrixKiWqD/gwzEfkZWb7
	tW8F2dj80a9uf60iJgKcrQVi7j6KXbOZUb8cHkKrDzwID3yE41Q33NmVsWNHHw==
X-Gm-Gg: ASbGncunAD2bXewpbVpK0iRtIr0s/2BZDvHn8TIT1OAjTj2yiIbVahOwwJNqzjLzPLj
	1AeA8cJWa8+8TA0Wr56gpFT8IAjTuflxy4QhhVQ4VoCRQVoN0SgtU8xlZpTCdF5lbjisrvBPlQA
	RSoZ4R1DFhgRp1z8+6k4FA5Rxia60G/itbQWWWiK0zvpvao/QKLWCM+hXxJJuHWrkbC2AtW29Rg
	LFBVO9Cp7xB4syXeYmDgT+l7291cezCb6ce24hzfdHvSBbnoCcWzqA6pfcfr/A9is8Jn7QrM5ul
	FHqKs3DxmFm3SfsS2eJrZXLO3v7WqcVq7jR6QzbFV2AkgBk/pu64CViFl8S1ic6/5A7pJdO+yfr
	4f6fnys3ngL0/5kQzIkx5FX41PDrN9mr22LVNxA==
X-Google-Smtp-Source: AGHT+IG5soVxsZ8/xdkXvSGXhKe5y2I7AECvwFBOSDCoSq7VtIdBtSLQPfxwdrL8MgXC+Cu18J24yA==
X-Received: by 2002:a05:620a:4711:b0:7c5:5596:8457 with SMTP id af79cd13be357-7c59b2c5ce6mr62410285a.57.1742232786512;
        Mon, 17 Mar 2025 10:33:06 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c9e081sm609931285a.56.2025.03.17.10.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:33:05 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:33:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/8] RFT/RFC: Import IPU6 ov02e10 sensor driver and
 enable OF usage of it
Message-ID: <685ef286-0694-44c6-85c2-c6c5f51ce6a4@rowland.harvard.edu>
References: <20250317-b4-media-comitters-next-25-03-13-ov02e10-v1-0-bd924634b889@linaro.org>
 <89af0891-3bbe-4964-8d19-205cdab79497@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89af0891-3bbe-4964-8d19-205cdab79497@redhat.com>

On Mon, Mar 17, 2025 at 10:02:41AM +0100, Hans de Goede wrote:
> Bryan, thank you for your work on this.
> 
> Alan, can you give this version of the driver a test run on your laptop?
> 
> Note you need to skip patch 3/8 for now until I've implemented the
> solution for handshake handling in the INT3472 driver. Also you need
> keep the sleep of at least 25 ms after setting the handshake GPIO.

After installing all the patches except for 3/8 (and adjusting some of 
the later ones to account for its lack), I can confirm that the camera 
on my laptop still works.

Is there any particular aspect you want me to test or is basic 
functionality good enough?

Alan

