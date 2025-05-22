Return-Path: <linux-media+bounces-33209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD44AC14EE
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0554E114C
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433E62BE7B7;
	Thu, 22 May 2025 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="eKf8AiD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB61DF975
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 19:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943037; cv=none; b=fsJyuWFRQpKvELlJVHaBjszX6VIavqENs3tZohGTdrQIYSYGhdk3LQGrqwhSpOb8N6cLON6NELBsiwSoY+AS38zkrZ/4FbTUl1MDsw09DBCKg8HHnsvpKNs6opsUFCdaTwU2SqYN2DMZMD7GLhPzW02cGG10SRHjh4QKvODaG1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943037; c=relaxed/simple;
	bh=/Z5Ze8or+JRgFSFweK/yZujXEyGXXBti7Q46Zw3/Tmo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dbGnWcLLXRDhPnQjHnHKZG25iom857XH+bSTeVkkfaEAwyaZBEO7RYBRhKpYMWXTz910i1ElaGClD3ifVcrCppdSx/20N8m1elNsf9GQk/mAMthYQAaAbszrve7nW1Z0a2SE4bD3o//+pfoiBilWMFV88tvt5bbtCuOjLNXN0yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=eKf8AiD0; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c54b651310so1203269985a.0
        for <linux-media@vger.kernel.org>; Thu, 22 May 2025 12:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747943035; x=1748547835; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sJXIaFr6+YHPCMEw9fLiEbl1hSwx4GvnoilfxQICzcs=;
        b=eKf8AiD0PzwpWNNWW4El0ue5/kKr847sR1R6GXsZl3aSWKc+UndJ+T1vTwgTu1/EXk
         6gwvo6co3sANSZOSombpZ0RJR1zHyizbIKYIPpy5Rqew4WeedA4IrQUaORYfk3hSn/2O
         ryV5t1fqbPqcXQiqJMCTHx1nJR0pOyyqopu5Pm8iJ9glGY7TgiM4ELD2VWtblXiIFLTF
         u6+wtXjlTuMUnJ22okHzJ/qOcH0HLDgK9zb53hJKQWQpH9emSp0SCxhi8Wb2J0YVQq+9
         wz0f9nXWbfso59aYQstVFxI6myscbaky6ekpfPPOfFiRFsEWgM2BnAUfICkG1AVUiVtS
         sz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747943035; x=1748547835;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJXIaFr6+YHPCMEw9fLiEbl1hSwx4GvnoilfxQICzcs=;
        b=rQA/4366ManA6ihsCs+BD2sarVgi+e0JxGPR3m7BqFDC8xhylRVXzdS6ESxP85T3zK
         wfRcQYrT0pVrOK7Jg/3i1wDEghAZlX2hamehyvKVvAWWPoVyycriWe8TlMS+BJplMXbX
         a560GIlPKW6pT7l3cvR2bNTqkDLiimZToieq/3Qb1clpjIySfiCbFq9O4O3zWdB37876
         Q8fA0yJfANPxw6VL2iYWOeowVfFeMZ+DAH333LSq3+99URrWkTp6Jj3j5yKUvECmvK4M
         tGuhuOXqSkyInNlgjwKjaGoXJRz7I5g15vNDCRZrWkvhcT4H0gAWm0cGavAIvLXujrbr
         wMow==
X-Forwarded-Encrypted: i=1; AJvYcCU3Usu/CPpemXjDydQoUaQWNZPw+/nKT2bk4cEZ8Rp1w0hr/lXOq5qQQSzFjZAi6D/pR4HWPCMtTJ3irg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6yDNaqzcXMPtMJbn8SUT/l6DedLailnmSYzn3cS0DLo8ufeve
	xhwkAx9/7yusppPraRBOWdSfBO0eqKWNvQSoZ2eOfKuwyrq6PxgDGZbwpxqg1YSWqXQ=
X-Gm-Gg: ASbGncscjizv+sPoqzuxbCyA5zbT8C/yt3sjtf2UayG2Pc1KGGx4expydWdG+lfjCG9
	HLxV4NdGRSpFVYqPVCAgUaichg/OOt30hKEgqiLa2uK8gCFolGBKbLerU/ji03kkimmErl09yqm
	AIGJV1WKFdnqunVpo7CPG49lk49D/kvknYCP4vbLTGFgKbdDyOZ+MrbGntrPKeM93rqvNDEK9fe
	E4uYwo3maoxJy38xOp+GV3fN50nbaIDPkT5rGQUG1nJLDyKBV/jnJcG873as37feDJSv9qeuA4B
	3bKOPdOwz0zo4GOMYUwI9Qx7TaMZob5N2zXTGw0ioEogB214aUrh2TAM
X-Google-Smtp-Source: AGHT+IFDXMxGr02MLC9kNByDKOUfa4jgk4t3IVO8hLQ2xi5sOOYcAhMjd53IsbZuvN4a00OyXQwcQA==
X-Received: by 2002:a05:620a:288d:b0:7c5:3e89:c6df with SMTP id af79cd13be357-7cd47effed9mr3281280685a.12.1747943034939;
        Thu, 22 May 2025 12:43:54 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cc89fsm1063450285a.105.2025.05.22.12.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:43:54 -0700 (PDT)
Message-ID: <5872699dd6f06a3516fb7a8ecac76ed955ce937b.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: mc: entity: Add pipeline_started/stopped ops
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	mchehab@kernel.org
Date: Thu, 22 May 2025 15:43:53 -0400
In-Reply-To: <20250519140403.443915-2-dan.scally@ideasonboard.com>
References: <20250519140403.443915-1-dan.scally@ideasonboard.com>
	 <20250519140403.443915-2-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le lundi 19 mai 2025 =C3=A0 15:04 +0100, Daniel Scally a =C3=A9crit=C2=A0:
> Add two new members to struct media_entity_operations, along with new
> functions in media-entity.c to traverse a media pipeline and call the
> new operations. The new functions are intended to be used to signal
> to a media pipeline that it has fully started, with the entity ops
> allowing drivers to define some action to be taken when those
> conditions are met.
>=20
> The combination of the new functions and operations allows drivers
> which are part of a multi-driver pipeline to delay actually starting
> streaming until all of the conditions for streaming succcessfully are
> met across all drivers.
>=20
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> =C2=A0drivers/media/mc/mc-entity.c | 45 +++++++++++++++++++++++++++++++++=
+++
> =C2=A0include/media/media-entity.h | 24 +++++++++++++++++++
> =C2=A02 files changed, 69 insertions(+)
>=20
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 045590905582..e36b1710669d 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1053,6 +1053,51 @@ __media_pipeline_entity_iter_next(struct media_pip=
eline *pipe,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
> =C2=A0
> +int media_pipeline_started(struct media_pipeline *pipe)
> +{
> +	struct media_pipeline_entity_iter iter;
> +	struct media_entity *entity;
> +	int ret;
> +
> +	ret =3D media_pipeline_entity_iter_init(pipe, &iter);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_for_each_entity(pipe, &iter, entity) {
> +		ret =3D media_entity_call(entity, pipeline_started);
> +		if (ret && ret !=3D -ENOIOCTLCMD)
> +			goto err_notify_stopped;
> +	}

Would this be more useful if it had a specified traversal order ? Perhaps
sink to source traversal?

Nicolas

> +
> +	media_pipeline_entity_iter_cleanup(&iter);
> +
> +	return ret =3D=3D -ENOIOCTLCMD ? 0 : ret;
> +
> +err_notify_stopped:
> +	media_pipeline_stopped(pipe);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_started);
> +
> +int media_pipeline_stopped(struct media_pipeline *pipe)
> +{
> +	struct media_pipeline_entity_iter iter;
> +	struct media_entity *entity;
> +	int ret;
> +
> +	ret =3D media_pipeline_entity_iter_init(pipe, &iter);
> +	if (ret)
> +		return ret;
> +
> +	media_pipeline_for_each_entity(pipe, &iter, entity)
> +		media_entity_call(entity, pipeline_stopped);
> +
> +	media_pipeline_entity_iter_cleanup(&iter);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(media_pipeline_stopped);
> +
> =C2=A0/* ----------------------------------------------------------------=
-------------
> =C2=A0 * Links management
> =C2=A0 */
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 64cf590b1134..e858326b95cb 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -269,6 +269,10 @@ struct media_pad {
> =C2=A0 *			media_entity_has_pad_interdep().
> =C2=A0 *			Optional: If the operation isn't implemented all pads
> =C2=A0 *			will be considered as interdependent.
> + * @pipeline_started:	Notify this entity that the pipeline it is a part =
of has
> + *			been started
> + * @pipeline_stopped:	Notify this entity that the pipeline it is a part =
of has
> + *			been stopped
> =C2=A0 *
> =C2=A0 * .. note::
> =C2=A0 *
> @@ -284,6 +288,8 @@ struct media_entity_operations {
> =C2=A0	int (*link_validate)(struct media_link *link);
> =C2=A0	bool (*has_pad_interdep)(struct media_entity *entity, unsigned int=
 pad0,
> =C2=A0				 unsigned int pad1);
> +	int (*pipeline_started)(struct media_entity *entity);
> +	void (*pipeline_stopped)(struct media_entity *entity);
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -1261,6 +1267,24 @@ __media_pipeline_entity_iter_next(struct media_pip=
eline *pipe,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 entity !=3D NULL;							\
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 entity =3D __media_pipeline_entity_iter_n=
ext((pipe), iter, entity))
> =C2=A0
> +/**
> + * media_pipeline_started - Inform entities in a pipeline that it has st=
arted
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_s=
tarted
> + * member of media_entity_operations.
> + */
> +int media_pipeline_started(struct media_pipeline *pipe);
> +
> +/**
> + * media_pipeline_stopped - Inform entities in a pipeline that it has st=
opped
> + * @pipe:	The pipeline
> + *
> + * Iterate on all entities in a media pipeline and call their pipeline_s=
topped
> + * member of media_entity_operations.
> + */
> +int media_pipeline_stopped(struct media_pipeline *pipe);
> +
> =C2=A0/**
> =C2=A0 * media_pipeline_alloc_start - Mark a pipeline as streaming
> =C2=A0 * @pad: Starting pad

